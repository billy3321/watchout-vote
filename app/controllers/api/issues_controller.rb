class Api::IssuesController < ApplicationController
  respond_to :json

  def index
    ransack_params = {}
    ransack_params[:name_or_description_cont] = params[:query] if params[:query]
    if ransack_params.blank?
      @issues = Issue.published.offset(params[:offset]).limit(params[:limit])
      @issues_count = Issue.published.count
    else
      @issues = Issue.published.ransack(ransack_params).result(distinct: true)
        .offset(params[:offset]).limit(params[:limit])
      @issues_count = Issue.published.ransack(ransack_params).result(distinct: true).count
    end
    respond_with(@issues, @issues_count)
  end

  def show
    @issue = Issue.find(params[:id])
    respond_with(@issue)
  end

  def slides
    @issue = Issue.find(params[:id])
    if @issue and @issue.published
      ransack_params = {}
      ransack_params[:alt_cont] = params[:query] if params[:query]
      if ransack_params.blank?
        @slides = @issue.slides.offset(params[:offset]).limit(params[:limit])
        @slides_count = @issue.slides.count
      else
        @slides = @issue.slides.ransack(ransack_params).result(distinct: true)
          .offset(params[:offset]).limit(params[:limit])
        @slides_count = @issue.slides.ransack(ransack_params).result(distinct: true).count
      end
      respond_with(@slides, @slides_count)
    end
  end
end