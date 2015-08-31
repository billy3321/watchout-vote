class VotesController < ApplicationController
  before_action :set_vote, except: [:index, :new, :update_votes, :sort]

  # GET /votes
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  def show
    @candidate_standpoints = @vote.candidate.candidate_standpoints.includes(:issue)
  end

  def clarify
    @clarify_mail = ClarifyMail.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    if params[:vote_id]
      @vote = Vote.find(params[:vote_id])
    else
      @vote = params[:id] ? Vote.find(params[:id]) : Vote.new(vote_params)
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.require(:vote).permit()
  end
end