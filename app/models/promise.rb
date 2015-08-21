class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
  delegate :party, to: :candidate, allow_nil: false
end
