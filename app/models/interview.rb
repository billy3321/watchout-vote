class Interview < ActiveRecord::Base
  belongs_to :candidate
  mount_uploader :image, ImageUploader
end
