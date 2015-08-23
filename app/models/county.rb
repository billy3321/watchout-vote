class County < ActiveRecord::Base
  has_many :districts, through: :constituencies
  has_many :constituencies
  validates_presence_of :name, message: '請填寫名稱'
end
