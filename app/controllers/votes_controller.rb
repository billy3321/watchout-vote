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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = params[:id] ? Vote.find(params[:id]) : Vote.new(vote_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.require(:vote).permit()
  end
end