class CandidatesController < ApplicationController
  before_action :set_candidate, except: [:index, :new]
  before_action :set_issue, except: [:index, :new, :issues, :show]
  before_action :set_candidate_standpoints, except: [:index, :new, :show]
  before_action :set_candidate_standpoint, except: [:index, :new, :issues, :show]

  # GET /candidates
  def index
    @candidates = Candidate.all
    set_meta_tags({
      title: "所有議題"
    })
  end

  # GET /candidates/1
  def show
  end

  def issues
    @candidates = Candidate.includes(:candidate_standpoints).all
  end

  def issue
  end

  def bills
    @bills = Bill.get_candidate_bill(@candidate, @issue).page(params[:page])
  end

  def interpellations
    @interpellations = Interpellation.get_candidate_interpellation(@candidate, @issue).page(params[:page])
  end

  def votes
    @votes = Vote.get_candidate_vote(@candidate, @issue).page(params[:page])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    unless params[:candidate_id].blank?
      @candidate = Candidate.find(params[:candidate_id])
    else
      @candidate = params[:id] ? Candidate.find(params[:id]) : Candidate.new(candidate_params)
    end
  end

  def set_issue
    @issue = params[:id] ? Issue.published.find(params[:id]) : nil
  end

  def set_candidate_standpoint
    @candidate_standpoint = CandidateStandpoint.get_standpoint(@candidate, @issue)
  end

  def set_candidate_standpoints
    @candidate_standpoints = @candidate.candidate_standpoints.includes(:issue)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit()
  end
end