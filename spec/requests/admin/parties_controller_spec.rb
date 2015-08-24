require "rails_helper"

describe "Admin/Party" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:party) { FactoryGirl.create(:party) }
  let(:new_party) do
    {
      name: "new_party_name",
      short_name: "new_party_short_name",
      abbreviation: "new_party_abbreviation",
      description: "new_party_descriptioin",
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      background: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg'))
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/parties/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/parties/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/parties/#{party.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/parties", party: new_party
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        party
        old_name = party.name
        update_data = { name: "new_name" }
        put "/admin/parties/#{party.id}", party: update_data
        expect(response).to be_redirect
        party.reload
        expect(party.name).to eq(old_name)
      end
    end

    describe "#destroy" do
      it "redirect" do
        party
        expect {
          delete "/admin/parties/#{party.id}"
        }.to change { Party.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/parties/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/parties/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/parties/#{party.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/parties", party: new_party
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        party
        old_name = party.name
        update_data = { name: "new_name" }
        put "/admin/parties/#{party.id}", party: update_data
        expect(response).to be_redirect
        party.reload
        expect(party.name).to eq(old_name)
      end
    end

    describe "#destroy" do
      it "redirect" do
        party
        expect {
          delete "/admin/parties/#{party.id}"
        }.to change { Party.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/parties/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/parties/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/parties/#{party.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/parties", party: new_party
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        party
        update_data = { name: "new_name" }
        put "/admin/parties/#{party.id}", party: update_data
        expect(response).to be_redirect
        party.reload
        expect(party.name).to eq(update_data[:name])
      end
    end

    describe "#destroy" do
      it "success" do
        party
        expect {
          delete "/admin/parties/#{party.id}"
        }.to change { Party.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end