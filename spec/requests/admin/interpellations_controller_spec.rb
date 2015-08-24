require "rails_helper"

describe "Admin/Interpellation" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:interpellation) { FactoryGirl.create(:interpellation) }
  let(:clarify) { FactoryGirl.create(:interpellation_clarify) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:new_interpellation) do
    {
      content: "new_interpellation_content",
      description: "new_interpellation_descriptioin",
      summary: "new_interpellation_summary",
      decision: "agree",
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/interpellations/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/interpellations/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/interpellations/#{interpellation.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/interpellations", interpellation: new_interpellation
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        interpellation
        old_summary = interpellation.summary
        update_data = { summary: "new_summary" }
        put "/admin/interpellations/#{interpellation.id}", interpellation: update_data
        expect(response).to be_redirect
        interpellation.reload
        expect(interpellation.summary).to eq(old_summary)
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
        put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
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
          put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        interpellation
        expect {
          delete "/admin/interpellations/#{interpellation.id}"
        }.to change { Interpellation.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/interpellations/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/interpellations/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/interpellations/#{interpellation.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/interpellations", interpellation: new_interpellation
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        interpellation
        old_summary = interpellation.summary
        update_data = { summary: "new_summary" }
        put "/admin/interpellations/#{interpellation.id}", interpellation: update_data
        expect(response).to be_redirect
        interpellation.reload
        expect(interpellation.summary).to eq(old_summary)
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
        put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
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
          put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        interpellation
        expect {
          delete "/admin/interpellations/#{interpellation.id}"
        }.to change { Interpellation.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/interpellations/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/interpellations/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/interpellations/#{interpellation.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/interpellations", interpellation: new_interpellation
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        interpellation
        update_data = { summary: "new_summary" }
        put "/admin/interpellations/#{interpellation.id}", interpellation: update_data
        expect(response).to be_redirect
        interpellation.reload
        expect(interpellation.summary).to eq(update_data[:summary])
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
        put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
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
          put "/admin/interpellations/#{clarify.record_id}", interpellation: update_clarify_data
        }.to change { Clarify.count }.by(-1)
      end
    end

    describe "#destroy" do
      it "success" do
        interpellation
        expect {
          delete "/admin/interpellations/#{interpellation.id}"
        }.to change { Interpellation.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end