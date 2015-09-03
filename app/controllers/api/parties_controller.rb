class Api::PartiesController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:name_or_short_name_cont] = params[:query] if params[:query]
    if ransack_params.blank?
      @parties = Party.offset(params[:offset]).limit(params[:limit])
      @parties_count = Party.all.count
    else
      @parties = Party.ransack(ransack_params).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @parties_count = Party.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@parties, @parties_count)
  end

  def show
    @party = Party.find(params[:id])
    respond_with(@party)
  end
end