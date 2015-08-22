class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :question
  delegate :issue, to: :question, allow_nil: false
  delegate :party, to: :candidate, allow_nil: false
end
