class Candidate < ActiveRecord::Base
  has_many :interviews
  belongs_to :eight_constituency, class_name: "Constituency"
  belongs_to :nine_constituency,  class_name: "Constituency"
  belongs_to :party
  has_many :candidate_standpoints
  has_and_belongs_to_many :committees, -> { uniq }
  has_and_belongs_to_many :dms, -> { uniq }
  mount_uploader :image, ImageUploader
  validates_presence_of :name, message: '請填寫姓名'
  validates_presence_of :image, message: '請上傳照片'
  validates_presence_of :party_id, message: '請選擇政黨'

  scope :with_interviews, -> { joins(:interviews) }
  scope :random_sort, -> { order("RANDOM()") }

end
