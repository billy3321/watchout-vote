class Interview < ActiveRecord::Base
  belongs_to :candidate
  validates_presence_of :candidate_id,  message: '請選擇候選人'
  validates_presence_of :image,  message: '請上傳圖片'
  validates_presence_of :date,  message: '請輸入日期'
  mount_uploader :image, ImageUploader
  default_scope { order(position: :asc) }

  before_save :set_position
  scope :published, -> { where(published: true) }

  private

  def set_position
    if not self.position
      self.position = self.candidate.interviews.maximum("position").to_i + 1
    end
  end
end
