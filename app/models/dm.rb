class Dm < ActiveRecord::Base
  belongs_to :issue
  has_and_belongs_to_many :parties, -> { uniq }
  has_and_belongs_to_many :candidates, -> { uniq }
  mount_uploader :image, ImageUploader
end
