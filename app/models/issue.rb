class Issue < ActiveRecord::Base
  has_many :dms
  has_many :slides, dependent: :destroy
  has_many :bills
  has_many :interpellations
  has_many :votes
  has_many :questions
  has_many :promises, through: :questions
  has_many :party_standpoints
  has_many :candidate_standpoints
  mount_uploader :image, ImageUploader
  # accepts_nested_attributes_for :slides, reject_if: :all_blank, allow_destroy: true
end
