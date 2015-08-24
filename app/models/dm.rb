class Dm < ActiveRecord::Base
  belongs_to :issue
  has_and_belongs_to_many :parties, -> { uniq }
  has_and_belongs_to_many :candidates, -> { uniq }
  mount_uploader :image, ImageUploader
  validates_presence_of :name, message: '請輸入檔案名稱'
  validates_presence_of :file, message: '請輸入檔案位置'
end
