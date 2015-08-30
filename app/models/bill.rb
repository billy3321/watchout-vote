class Bill < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
  delegate :party, to: :candidate, allow_nil: false
  has_one :clarify, as: :record
  belongs_to :committee
  accepts_nested_attributes_for :clarify, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :candidate_id, message: '請選擇候選人'
  validates_presence_of :issue_id, message: '請選擇議題'
  validates_presence_of :date, message: '請填寫提案日期'
  validates_presence_of :content, message: '請填入內容'
  validates_presence_of :summary, message: '請填寫立場判斷'
  validates_presence_of :decision, message: '請選擇立場'
  validates_presence_of :url, message: '請填寫來源網址'
  validates :decision, inclusion: { in: %w(agree disagree abstain notvote),
    message: "立場字串不正確" }

  scope :date_asc, -> { order("date ASC").order("created_at ASC") }
  scope :date_desc, -> { order("date DESC").order("created_at DESC") }

  def self.get_party_bill(party, issue)
    joins(:candidate).where("candidates.party_id = ? AND issue_id = ?", party.id, issue.id)
  end

  def self.get_candidate_bill(candidate, issue)
    includes(:candidate).where("candidate_id = ? AND issue_id = ?", candidate.id, issue.id)
  end
end
