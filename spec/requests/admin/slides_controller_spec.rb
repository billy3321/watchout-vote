require "rails_helper"

describe "Admin/Slide" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:slide) { FactoryGirl.create(:slide) }
  let(:new_slide) do
    {
      alt: "new_slide_alt",
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      published: true
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/#{slide.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/issues/#{issue.id}/slides", slide: new_slide
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        slide
        old_alt = slide.alt
        update_data = { alt: "new_alt" }
        put "/admin/issues/#{issue.id}/slides/#{slide.id}", slide: update_data
        expect(response).to be_redirect
        slide.reload
        expect(slide.alt).to eq(old_alt)
      end
    end

    describe "#destroy" do
      it "redirect" do
        slide
        expect {
          delete "/admin/issues/#{issue.id}/slides/#{slide.id}"
        }.to change { Slide.count }.by(0)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "failed" do
        slide1 = FactoryGirl.create(:slide, issue: issue)
        slide2 = FactoryGirl.create(:slide, issue: issue)
        sort_data = {
          slide: {
            order: {
              '0': {
                id: slide1.id,
                position: 2
              },
              '1': {
                id: slide2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/slides/sort", sort_data
        slide1.reload
        slide2.reload
        expect(issue.slides).to eq([slide1, slide2])
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/slides/#{slide.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/issues/#{issue.id}/slides", slide: new_slide
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        slide
        old_alt = slide.alt
        update_data = { alt: "new_alt" }
        put "/admin/issues/#{issue.id}/slides/#{slide.id}", slide: update_data
        expect(response).to be_redirect
        slide.reload
        expect(slide.alt).to eq(old_alt)
      end
    end

    describe "#destroy" do
      it "redirect" do
        slide
        expect {
          delete "/admin/issues/#{issue.id}/slides/#{slide.id}"
        }.to change { Slide.count }.by(0)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "failed" do
        slide1 = FactoryGirl.create(:slide, issue: issue)
        slide2 = FactoryGirl.create(:slide, issue: issue)
        sort_data = {
          slide: {
            order: {
              '0': {
                id: slide1.id,
                position: 2
              },
              '1': {
                id: slide2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/slides/sort", sort_data
        slide1.reload
        slide2.reload
        expect(issue.slides).to eq([slide1, slide2])
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/issues/#{issue.id}/slides/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/issues/#{issue.id}/slides/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/issues/#{issue.id}/slides/#{slide.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/issues/#{issue.id}/slides", slide: new_slide
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        slide
        update_data = { alt: "new_alt" }
        put "/admin/issues/#{issue.id}/slides/#{slide.id}", slide: update_data
        expect(response).to be_redirect
        slide.reload
        expect(slide.alt).to eq(update_data[:alt])
      end
    end

    describe "#destroy" do
      it "success" do
        slide
        expect {
          delete "/admin/issues/#{issue.id}/slides/#{slide.id}"
        }.to change { Slide.count }.by(-1)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "success" do
        slide1 = FactoryGirl.create(:slide, issue: issue)
        slide2 = FactoryGirl.create(:slide, issue: issue)
        sort_data = {
          slide: {
            order: {
              '0': {
                id: slide1.id,
                position: 2
              },
              '1': {
                id: slide2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/slides/sort", sort_data
        slide1.reload
        slide2.reload
        expect(issue.slides).to eq([slide2, slide1])
      end
    end
  end
end