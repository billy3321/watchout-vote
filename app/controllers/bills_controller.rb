class BillsController < ApplicationController
  before_action :set_bill, except: [:index, :new, :update_bills, :sort]

  # GET /bills
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  def show
    @candidate_standpoints = @bill.candidate.candidate_standpoints.includes(:issue)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    @bill = params[:id] ? Bill.find(params[:id]) : Bill.new(bill_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bill_params
    params.require(:bill).permit()
  end
end