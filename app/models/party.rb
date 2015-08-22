class Party < ActiveRecord::Base
  has_many :candidates
  has_many :bills, through: :candidates
  has_many :interpellations, through: :candidates
  has_many :votes, through: :candidates
  has_and_belongs_to_many :dms, -> { uniq }
  has_many :party_standpoint
  mount_uploader :image, ImageUploader
  mount_uploader :background, ImageUploader
end
