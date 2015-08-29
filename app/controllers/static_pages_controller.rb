class StaticPagesController < ApplicationController
  def home
    @issues = Issue.all
    @candidates = Candidate.order("RANDOM()").first(10)
  end

  def about
  end

  def sitemap
  end
end
