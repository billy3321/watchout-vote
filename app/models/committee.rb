class Committee < ActiveRecord::Base
  has_and_belongs_to_many :candidates, -> { uniq }
  validates_presence_of :name, message: '請填寫名稱'
end
