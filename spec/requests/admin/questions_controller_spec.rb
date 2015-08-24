require "rails_helper"

describe "Admin/Question" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:question) { FactoryGirl.create(:question) }
  let(:new_question) do
    {
      issue_id: issue.id,
      title: "new_question_title",
      description: "new_question_descriptioin",
      content: "new_question_content"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/questions/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/questions/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/questions/#{question.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/questions", question: new_question
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        question
        old_title = question.title
        update_data = { title: "new_title" }
        put "/admin/questions/#{question.id}", question: update_data
        expect(response).to be_redirect
        question.reload
        expect(question.title).to eq(old_title)
      end
    end

    describe "#destroy" do
      it "redirect" do
        question
        expect {
          delete "/admin/questions/#{question.id}"
        }.to change { Question.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/questions/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/questions/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/questions/#{question.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/questions", question: new_question
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        question
        old_title = question.title
        update_data = { title: "new_title" }
        put "/admin/questions/#{question.id}", question: update_data
        expect(response).to be_redirect
        question.reload
        expect(question.title).to eq(old_title)
      end
    end

    describe "#destroy" do
      it "redirect" do
        question
        expect {
          delete "/admin/questions/#{question.id}"
        }.to change { Question.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/questions/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/questions/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/questions/#{question.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/questions", question: new_question
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        question
        update_data = { title: "new_title" }
        put "/admin/questions/#{question.id}", question: update_data
        expect(response).to be_redirect
        question.reload
        expect(question.title).to eq(update_data[:title])
      end
    end

    describe "#destroy" do
      it "success" do
        question
        expect {
          delete "/admin/questions/#{question.id}"
        }.to change { Question.count }.by(-1)
        expect(response).to be_redirect
      end
    end

  end
end