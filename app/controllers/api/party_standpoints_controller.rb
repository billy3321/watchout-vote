class Api::PartyStandpointsController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:issue_name] = params[:issue] if params[:issue]
    if params[:party]
      unless params[:party] == "null"
        ransack_params[:party_abbreviation] = params[:party]
      else
        ransack_params[:party_abbreviation_null] = true
      end
    end
    ransack_params[:decision] = params[:decision] if params[:decision]
    if ransack_params.blank?
      @party_standpoints = PartyStandpoint.includes(:party, :issue).offset(params[:offset]).limit(params[:limit])
      @party_standpoints_count = PartyStandpoint.count
    else
      @party_standpoints = PartyStandpoint.includes(:party, :issue).ransack(ransack_params).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @party_standpoints_count = PartyStandpoint.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@party_standpoints, @party_standpoints_count)
  end

  def show
    @party_standpoint = PartyStandpoint.find(params[:id])
    respond_with(@party_standpoint)
  end
end