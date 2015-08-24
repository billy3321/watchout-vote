require "rails_helper"

describe "Admin/Promise" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:question) { FactoryGirl.create(:question) }
  let(:promise) { FactoryGirl.create(:promise) }
  let(:new_promise) do
    {
      candidate_id: candidate.id,
      question_id: question.id,
      answer: "new_promise_answer",
      summary: "new_promise_summary",
      decision: "agree",
      date: Date.today
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/promises/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/promises/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/promises/#{promise.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/promises", promise: new_promise
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        promise
        old_summary = promise.summary
        update_data = { summary: "new_summary" }
        put "/admin/promises/#{promise.id}", promise: update_data
        expect(response).to be_redirect
        promise.reload
        expect(promise.summary).to eq(old_summary)
      end
    end

    describe "#destroy" do
      it "redirect" do
        promise
        expect {
          delete "/admin/promises/#{promise.id}"
        }.to change { Promise.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/promises/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/promises/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/promises/#{promise.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/promises", promise: new_promise
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        promise
        old_summary = promise.summary
        update_data = { summary: "new_summary" }
        put "/admin/promises/#{promise.id}", promise: update_data
        expect(response).to be_redirect
        promise.reload
        expect(promise.summary).to eq(old_summary)
      end
    end

    describe "#destroy" do
      it "redirect" do
        promise
        expect {
          delete "/admin/promises/#{promise.id}"
        }.to change { Promise.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/promises/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/promises/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/promises/#{promise.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/promises", promise: new_promise
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        promise
        update_data = { summary: "new_summary" }
        put "/admin/promises/#{promise.id}", promise: update_data
        expect(response).to be_redirect
        promise.reload
        expect(promise.summary).to eq(update_data[:summary])
      end
    end

    describe "#destroy" do
      it "success" do
        promise
        expect {
          delete "/admin/promises/#{promise.id}"
        }.to change { Promise.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end