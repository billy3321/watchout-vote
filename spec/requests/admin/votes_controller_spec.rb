require "rails_helper"

describe "Admin/Vote" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:vote) { FactoryGirl.create(:vote) }
  let(:clarify) { FactoryGirl.create(:vote_clarify) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:new_vote) do
    {
      content: "new_vote_content",
      description: "new_vote_descriptioin",
      summary: "new_vote_summary",
      decision: "agree",
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/votes/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/votes/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/votes/#{vote.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/votes", vote: new_vote
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        vote
        old_summary = vote.summary
        update_data = { summary: "new_summary" }
        put "/admin/votes/#{vote.id}", vote: update_data
        expect(response).to be_redirect
        vote.reload
        expect(vote.summary).to eq(old_summary)
      end
    end

    describe "nested #update" do
      it "failed" do
        clarify
        old_content = clarify.content
        update_clarify_data = {
          clarify_attributes:{
            id: clarify.id,
            content: 'new_clarify_content'
          }
        }
        put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        expect(response).to be_redirect
        clarify.reload
        expect(clarify.content).to match(old_content)
      end
    end

    describe "nested #update delete" do
      it "success" do
        clarify
        update_clarify_data = {
          clarify_attributes: {
            id: clarify.id,
            _destroy: 1
          }
        }
        expect {
          put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        vote
        expect {
          delete "/admin/votes/#{vote.id}"
        }.to change { Vote.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/votes/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/votes/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/votes/#{vote.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/votes", vote: new_vote
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        vote
        old_summary = vote.summary
        update_data = { summary: "new_summary" }
        put "/admin/votes/#{vote.id}", vote: update_data
        expect(response).to be_redirect
        vote.reload
        expect(vote.summary).to eq(old_summary)
      end
    end

    describe "nested #update" do
      it "failed" do
        clarify
        old_content = clarify.content
        update_clarify_data = {
          clarify_attributes:{
            id: clarify.id,
            content: 'new_clarify_content'
          }
        }
        put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        expect(response).to be_redirect
        clarify.reload
        expect(clarify.content).to match(old_content)
      end
    end

    describe "nested #update delete" do
      it "success" do
        clarify
        update_clarify_data = {
          clarify_attributes: {
            id: clarify.id,
            _destroy: 1
          }
        }
        expect {
          put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        vote
        expect {
          delete "/admin/votes/#{vote.id}"
        }.to change { Vote.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/votes/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/votes/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/votes/#{vote.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/votes", vote: new_vote
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        vote
        update_data = { summary: "new_summary" }
        put "/admin/votes/#{vote.id}", vote: update_data
        expect(response).to be_redirect
        vote.reload
        expect(vote.summary).to eq(update_data[:summary])
      end
    end

    describe "nested #update" do
      it "success" do
        clarify
        update_clarify_data = {
          clarify_attributes:{
            id: clarify.id,
            content: 'new_clarify_content'
          }
        }
        put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        expect(response).to be_redirect
        clarify.reload
        expect(clarify.content).to match(update_clarify_data[:clarify_attributes][:content])
      end
    end

    describe "nested #update delete" do
      it "success" do
        clarify
        update_clarify_data = {
          clarify_attributes: {
            id: clarify.id,
            _destroy: 1
          }
        }
        expect {
          put "/admin/votes/#{clarify.record_id}", vote: update_clarify_data
        }.to change { Clarify.count }.by(-1)
      end
    end

    describe "#destroy" do
      it "success" do
        vote
        expect {
          delete "/admin/votes/#{vote.id}"
        }.to change { Vote.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end