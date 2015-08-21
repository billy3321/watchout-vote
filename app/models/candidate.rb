class Candidate < ActiveRecord::Base
  has_many :interviews
  has_one :ad_eight_datum
  has_one :ad_nine_datum
  belongs_to :party
  has_many :candidate_standpoint
  has_and_belongs_to_many :committees, -> { uniq }
  has_and_belongs_to_many :dms, -> { uniq }
end
