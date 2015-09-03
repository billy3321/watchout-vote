class Api::CandidateStandpointsController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:issue_name] = params[:issue] if params[:issue]
    if params[:party]
      unless params[:party] == "null"
        ransack_params[:candidate_party_abbreviation] = params[:party]
      else
        ransack_params[:candidate_party_abbreviation_null] = true
      end
    end
    ransack_params[:candidate_name] = params[:candidate] if params[:candidate]
    ransack_params[:decision] = params[:decision] if params[:decision]
    if ransack_params.blank?
      @candidate_standpoints = CandidateStandpoint.includes(:candidate, :issue).offset(params[:offset]).limit(params[:limit])
      @candidate_standpoints_count = CandidateStandpoint.count
    else
      @candidate_standpoints = CandidateStandpoint.includes(:candidate, :issue).ransack(ransack_params).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @candidate_standpoints_count = CandidateStandpoint.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@candidate_standpoints, @candidate_standpoints_count)
  end

  def show
    @candidate_standpoint = CandidateStandpoint.find(params[:id])
    respond_with(@candidate_standpoint)
  end
end