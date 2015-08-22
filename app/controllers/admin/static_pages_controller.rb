class Admin::StaticPagesController < Admin::BaseController
  def home
    @issues_count = Issue.all.count
    @candidates_count = Candidate.all.count
    @parties_count = Party.all.count
  end
end
