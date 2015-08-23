class Interview < ActiveRecord::Base
  belongs_to :candidate
  validates_presence_of :candidate_id,  message: '請選擇候選人'
  validates_presence_of :image,  message: '請上傳圖片'
  mount_uploader :image, ImageUploader
end
