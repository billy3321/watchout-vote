class Api::CandidatesController < ApplicationController
  respond_to :json

  def index
    if params[:query]
      @candidates = Candidate.ransack({name_cont: params[:query]}).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @candidates_count = Candidate.ransack({name_cont: params[:query]}).result(distinct: true).count
    else
      @candidates = Candidate.offset(params[:offset]).limit(params[:limit])
      @candidates_count = Candidate.all.count
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
      if params[:query]
        @interviews = @candidate.interviews.published.ransack({title_or_description_cont: params[:query]}).result(distinct: true)
          .offset(params[:offset]).limit(params[:limit])
        @interviews_count = @candidate.interviews.published.ransack({name_cont: params[:query]}).result(distinct: true).count
      else
        @interviews = @candidate.interviews.published.offset(params[:offset]).limit(params[:limit])
        @interviews_count = @candidate.interviews.published.count
      end
      respond_with(@interviews, @interviews_count)
    end
  end
end