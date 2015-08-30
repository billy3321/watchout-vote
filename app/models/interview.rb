class Interview < ActiveRecord::Base
  belongs_to :candidate
  validates_presence_of :candidate_id,  message: '請選擇候選人'
  validates_presence_of :image,  message: '請上傳圖片'
  validates_presence_of :date,  message: '請輸入日期'
  mount_uploader :image, ImageUploader
  default_scope { order(date: :desc) }
end
