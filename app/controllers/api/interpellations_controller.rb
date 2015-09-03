class Api::InterpellationsController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:content_or_summary_cont] = params[:query] if params[:query]
    if params[:party]
      unless params[:party] == "null"
        ransack_params[:candidate_party_abbreviation] = params[:party]
      else
        ransack_params[:candidate_party_abbreviation_null] = true
      end
    end
    ransack_params[:candidate_name] = params[:candidate] if params[:candidate]
    ransack_params[:committee_name] = params[:committee] if params[:committee]
    ransack_params[:decision] = params[:decision] if params[:decision]
    ransack_params[:date_gt] = params[:date_start] if params[:date_start]
    ransack_params[:date_lt] = params[:date_end] if params[:date_end]
    if ransack_params.blank?
      @interpellations = Interpellation.date_desc.includes(:candidate, :issue, :committee).offset(params[:offset]).limit(params[:limit])
      @interpellations_count = Interpellation.count
    else
      @interpellations = Interpellation.date_desc.includes(:candidate, :issue, :committee).ransack(ransack_params).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @interpellations_count = Interpellation.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@interpellations, @interpellations_count)
  end

  def show
    @interpellation = Interpellation.find(params[:id])
    respond_with(@interpellation)
  end
end