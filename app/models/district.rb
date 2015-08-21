class District < ActiveRecord::Base
  belongs_to :constituency
  delegate :county, to: :constituency, allow_nil: false
end
