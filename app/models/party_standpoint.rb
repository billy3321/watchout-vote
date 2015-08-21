class PartyStandpoint < ActiveRecord::Base
  belongs_to :party
  belongs_to :issue
end
