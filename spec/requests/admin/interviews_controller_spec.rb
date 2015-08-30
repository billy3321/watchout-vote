require "rails_helper"

describe "Admin/Interview" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:interview) { FactoryGirl.create(:interview) }
  let(:new_interview) do
    {
      candidate_id: candidate.id,
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      description: "new_interview_description",
      alt: "new_interview_alt",
      date: Date.today
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/interviews/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/interviews/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/interviews/#{interview.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/interviews", interview: new_interview
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        interview
        old_alt = interview.alt
        update_data = { alt: "new_alt" }
        put "/admin/interviews/#{interview.id}", interview: update_data
        expect(response).to be_redirect
        interview.reload
        expect(interview.alt).to eq(old_alt)
      end
    end

    describe "#destroy" do
      it "redirect" do
        interview
        expect {
          delete "/admin/interviews/#{interview.id}"
        }.to change { Interview.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/interviews/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/interviews/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/interviews/#{interview.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/interviews", interview: new_interview
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        interview
        old_alt = interview.alt
        update_data = { alt: "new_alt" }
        put "/admin/interviews/#{interview.id}", interview: update_data
        expect(response).to be_redirect
        interview.reload
        expect(interview.alt).to eq(old_alt)
      end
    end

    describe "#destroy" do
      it "redirect" do
        interview
        expect {
          delete "/admin/interviews/#{interview.id}"
        }.to change { Interview.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/interviews/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/interviews/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/interviews/#{interview.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/interviews", interview: new_interview
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        interview
        update_data = { alt: "new_alt" }
        put "/admin/interviews/#{interview.id}", interview: update_data
        expect(response).to be_redirect
        interview.reload
        expect(interview.alt).to eq(update_data[:alt])
      end
    end

    describe "#destroy" do
      it "success" do
        interview
        expect {
          delete "/admin/interviews/#{interview.id}"
        }.to change { Interview.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end