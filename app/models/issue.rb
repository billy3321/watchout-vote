class Issue < ActiveRecord::Base
  has_many :dms
  has_many :slides, dependent: :destroy
  has_many :bills
  has_many :interpellations
  has_many :votes
  has_many :questions
  has_many :promises, through: :questions
  has_many :party_standpoints
  has_many :candidate_standpoints
  mount_uploader :image, ImageUploader
  validates_presence_of :name, message: '請填寫名稱'
  validates_presence_of :candidate_id, message: '請選擇候選人'
  validates_presence_of :image, message: '請上傳圖片'
  validates_presence_of :description, message: '請輸入議題描述'
  # accepts_nested_attributes_for :slides, reject_if: :all_blank, allow_destroy: true
end
