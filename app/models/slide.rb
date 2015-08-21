class Slide < ActiveRecord::Base
  belongs_to :issue
  mount_uploader :image, ImageUploader
end
