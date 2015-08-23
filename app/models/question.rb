class Question < ActiveRecord::Base
  belongs_to :issue
  has_many :clarifies
  validates_presence_of :issue_id, message: '請選擇議題'
  validates_presence_of :title, message: '請填寫標題'
  validates_presence_of :description, message: '請填寫描述'
  validates_presence_of :content, message: '請填寫問題內容'
end
