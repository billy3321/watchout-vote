class Api::ConstituenciesController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:name_cont] = params[:query] if params[:query]
    if params[:county]
      unless params[:county] == "null"
        ransack_params[:county] = params[:county]
      else
        ransack_params[:county_id_null] = true
      end
    end
    if ransack_params.blank?
      @constituencies = Constituency.includes(:county, :districts, :candidates, :legislators).offset(params[:offset]).limit(params[:limit])
      @constituencies_count = Constituency.all.count
    else
      @constituencies = Constituency.includes(:county, :districts, :candidates, :legislators).ransack(ransack_params).result(distinct: true)
          .offset(params[:offset]).limit(params[:limit])
      @constituencies_count = Constituency.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@constituencies, @constituencies_count)
  end

  def show
    @constituency = Constituency.find(params[:id])
    respond_with(@constituency)
  end
end