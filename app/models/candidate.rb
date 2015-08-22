class Candidate < ActiveRecord::Base
  has_many :interviews
  belongs_to :eight_constituency, class_name: "Constituency"
  belongs_to :nine_constituency,  class_name: "Constituency"
  belongs_to :party
  has_many :candidate_standpoint
  has_and_belongs_to_many :committees, -> { uniq }
  has_and_belongs_to_many :dms, -> { uniq }
  mount_uploader :image, ImageUploader
end
