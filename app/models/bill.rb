class Bill < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
  belongs_to :record, polymorphic: true
  delegate :party, to: :candidate, allow_nil: false
  has_one :clarify, as: :record
  accepts_nested_attributes_for :clarify, reject_if: :all_blank, allow_destroy: true
end
