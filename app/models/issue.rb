class Issue < ActiveRecord::Base
  has_many :dms
  has_many :slides
  has_many :bills
  has_many :interpellations
  has_many :votes
  has_many :questions
  has_many :promises through: :questions
  has_many :party_standpoints
  has_many :candidate_standpoints
end
