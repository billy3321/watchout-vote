class Party < ActiveRecord::Base
  has_many :candidates
  has_many :bills, through: :candidates
  has_many :interpellations, through: :candidates
  has_many :votes, through: :candidates
  has_and_belongs_to_many :dms, -> { uniq }
  has_many :party_standpoints
  mount_uploader :image, ImageUploader
  mount_uploader :background, ImageUploader
  validates_presence_of :name, message: '請輸入全名'
  validates_presence_of :short_name, message: '請輸入中文縮寫'
  # validates_presence_of :abbreviation, message: '請輸入英文縮寫'
  before_destroy :detect_candidates
  # validates_presence_of :image, message: '請上傳小圖'
  # validates_presence_of :background, message: '請上傳背景圖片'

  private

  def detect_candidates
    if self.candidates.any?
      return false
    end
  end
end
