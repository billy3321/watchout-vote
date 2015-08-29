class StaticPagesController < ApplicationController
  def home
    @issues = Issue.all
    @candidates = Candidate.with_interviews.random_sort.first(10)
  end

  def about
  end

  def sitemap
  end
end
