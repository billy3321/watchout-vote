class InterpellationsController < ApplicationController
  before_action :set_interpellation, except: [:index, :new, :update_interpellations, :sort]

  # GET /interpellations
  def index
    @interpellations = Interpellation.all
  end

  # GET /interpellations/1
  def show
    @candidate_standpoints = @interpellation.candidate.candidate_standpoints.includes(:issue)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_interpellation
    @interpellation = params[:id] ? Interpellation.find(params[:id]) : Interpellation.new(interpellation_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interpellation_params
    params.require(:interpellation).permit()
  end
end