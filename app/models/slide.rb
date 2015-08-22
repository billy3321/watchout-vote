class Slide < ActiveRecord::Base
  belongs_to :issue
  mount_uploader :image, ImageUploader
  default_scope { order(position: :asc) }
end
