class Clarify < ActiveRecord::Base
  belongs_to :record, polymorphic: true
  validates_presence_of :content, message: '請填寫澄清內容'
  validates_presence_of :date, message: '請填寫澄清日期'
end
