class IssuesController < ApplicationController
  before_action :set_issue, except: [:index, :new, :update_issues, :sort]

  # GET /issues
  def index
    @issues = Issue.published.all
    set_meta_tags({
      title: "所有議題"
    })
  end

  # GET /issues/1
  def show
    @party_standpoints = @issue.party_standpoints.includes(:party)
    @candidate_standpoints = @issue.candidate_standpoints.includes(:candidate)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = params[:id] ? Issue.find(params[:id]) : Issue.new(issue_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit()
  end
end