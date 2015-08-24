require "rails_helper"

describe "Admin/CandidateStandpoint" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:candidate_standpoint) { FactoryGirl.create(:candidate_standpoint) }
  let(:new_candidate_standpoint) do
    {
      candidate_id: candidate.id,
      issue_id: issue.id,
      agree: 40,
      disagree: 10,
      abstain: 30,
      notvote: 20
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/candidate_standpoints/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/candidate_standpoints/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/candidate_standpoints/#{candidate_standpoint.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/candidate_standpoints", candidate_standpoint: new_candidate_standpoint
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        candidate_standpoint
        old_agree = candidate_standpoint.agree
        update_data = { agree: 50 }
        put "/admin/candidate_standpoints/#{candidate_standpoint.id}", candidate_standpoint: update_data
        expect(response).to be_redirect
        candidate_standpoint.reload
        expect(candidate_standpoint.agree).to eq(old_agree)
      end
    end

    describe "#destroy" do
      it "redirect" do
        candidate_standpoint
        expect {
          delete "/admin/candidate_standpoints/#{candidate_standpoint.id}"
        }.to change { CandidateStandpoint.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/candidate_standpoints/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/candidate_standpoints/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/candidate_standpoints/#{candidate_standpoint.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/candidate_standpoints", candidate_standpoint: new_candidate_standpoint
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        candidate_standpoint
        old_agree = candidate_standpoint.agree
        update_data = { agree: 50 }
        put "/admin/candidate_standpoints/#{candidate_standpoint.id}", candidate_standpoint: update_data
        expect(response).to be_redirect
        candidate_standpoint.reload
        expect(candidate_standpoint.agree).to eq(old_agree)
      end
    end

    describe "#destroy" do
      it "redirect" do
        candidate_standpoint
        expect {
          delete "/admin/candidate_standpoints/#{candidate_standpoint.id}"
        }.to change { CandidateStandpoint.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/candidate_standpoints/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/candidate_standpoints/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/candidate_standpoints/#{candidate_standpoint.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/candidate_standpoints", candidate_standpoint: new_candidate_standpoint
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        candidate_standpoint
        update_data = { agree: 50 }
        put "/admin/candidate_standpoints/#{candidate_standpoint.id}", candidate_standpoint: update_data
        expect(response).to be_redirect
        candidate_standpoint.reload
        expect(candidate_standpoint.agree).to eq(update_data[:agree])
      end
    end

    describe "#destroy" do
      it "success" do
        candidate_standpoint
        expect {
          delete "/admin/candidate_standpoints/#{candidate_standpoint.id}"
        }.to change { CandidateStandpoint.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end