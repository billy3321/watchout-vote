require "rails_helper"

describe "Admin/Bill" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:bill) { FactoryGirl.create(:bill) }
  let(:clarify) { FactoryGirl.create(:bill_clarify) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:new_bill) do
    {
      content: "new_bill_content",
      description: "new_bill_descriptioin",
      summary: "new_bill_summary",
      decision: "agree"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/bills/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/bills/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/bills/#{bill.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/bills", bill: new_bill
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        bill
        old_summary = bill.summary
        update_data = { summary: "new_summary" }
        put "/admin/bills/#{bill.id}", bill: update_data
        expect(response).to be_redirect
        bill.reload
        expect(bill.summary).to eq(old_summary)
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
        put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
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
          put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        bill
        expect {
          delete "/admin/bills/#{bill.id}"
        }.to change { Bill.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/bills/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/bills/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/bills/#{bill.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/bills", bill: new_bill
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        bill
        old_summary = bill.summary
        update_data = { summary: "new_summary" }
        put "/admin/bills/#{bill.id}", bill: update_data
        expect(response).to be_redirect
        bill.reload
        expect(bill.summary).to eq(old_summary)
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
        put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
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
          put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
        }.to change { Clarify.count }.by(0)
      end
    end

    describe "#destroy" do
      it "redirect" do
        bill
        expect {
          delete "/admin/bills/#{bill.id}"
        }.to change { Bill.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/bills/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/bills/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/bills/#{bill.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/bills", bill: new_bill
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        bill
        update_data = { summary: "new_summary" }
        put "/admin/bills/#{bill.id}", bill: update_data
        expect(response).to be_redirect
        bill.reload
        expect(bill.summary).to eq(update_data[:summary])
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
        put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
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
          put "/admin/bills/#{clarify.record_id}", bill: update_clarify_data
        }.to change { Clarify.count }.by(-1)
      end
    end

    describe "#destroy" do
      it "success" do
        bill
        expect {
          delete "/admin/bills/#{bill.id}"
        }.to change { Bill.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end