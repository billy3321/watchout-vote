class District < ActiveRecord::Base
  belongs_to :constituency
  delegate :county, to: :constituency, allow_nil: false
  validates_presence_of :name, message: '請填寫名稱'
end
