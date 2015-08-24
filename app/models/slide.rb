class Slide < ActiveRecord::Base
  belongs_to :issue
  mount_uploader :image, ImageUploader
  default_scope { order(position: :asc) }
  validates_presence_of :issue_id,  message: '請選擇議題'
  validates_presence_of :image,  message: '請上傳圖片'

  before_save :set_position

  private

  def set_position
    if not self.position
      self.position = self.issue.slides.maximum("position").to_i + 1
    end
  end
end
