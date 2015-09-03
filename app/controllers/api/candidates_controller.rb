class Api::CandidatesController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:name_cont] = params[:query] if params[:query]
    if params[:party]
      unless params[:party] == "null"
        ransack_params[:party_abbreviation] = params[:party]
      else
        ransack_params[:party_abbreviation_null] = true
      end
    end
    if params[:committee]
      committee = Committee.where(name: params[:committee]).first
      puts committee
      ransack_params[:committees_id_in] = [committee.id] unless committee.blank?
    end
    if ransack_params.blank?
      @candidates = Candidate.includes(:party, :committees).offset(params[:offset]).limit(params[:limit])
      @candidates_count = Candidate.all.count
    else
      @candidates = Candidate.includes(:party, :committees).ransack(ransack_params).result(distinct: true)
          .offset(params[:offset]).limit(params[:limit])
      @candidates_count = Candidate.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@candidates, @candidates_count)
  end

  def show
    @candidate = Candidate.find(params[:id])
    respond_with(@candidate)
  end

  def interviews
    @candidate = Candidate.find(params[:id])
    if @candidate
      ransack_params = {}
      ransack_params[:title_or_description_cont] = params[:query] if params[:query]
      if ransack_params.blank?
        @interviews = @candidate.interviews.published.offset(params[:offset]).limit(params[:limit])
        @interviews_count = @candidate.interviews.published.count
      else
        @interviews = @candidate.interviews.published.ransack(ransack_params).result(distinct: true)
          .offset(params[:offset]).limit(params[:limit])
        @interviews_count = @candidate.interviews.published.ransack(ransack_params).result(distinct: true).count        
      end
      respond_with(@interviews, @interviews_count)
    end
  end
end