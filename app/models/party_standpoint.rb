class PartyStandpoint < ActiveRecord::Base
  belongs_to :party
  belongs_to :issue
  validates_presence_of :party_id, message: '請選擇政黨'
  validates_presence_of :issue_id, message: '請選擇議題'
  validates_presence_of :agree, message: '請填寫同意比例'
  validates_presence_of :disagree, message: '請填寫反對比例'
  validates_presence_of :abstain, message: '請填寫棄權比例'
  validates_presence_of :notvote, message: '請填寫未投票比例'
  validates_presence_of :decision, message: '請確定政黨立場'
  validates :decision, inclusion: { in: %w(agree disagree abstain notvote),
    message: "立場字串不正確" }

  scope :agree, -> { where(decision: "agree") }
  scope :disagree, -> { where(decision: "disagree") }
  scope :abstain, -> { where(decision: "abstain") }
  scope :notvote, -> { where(decision: "notvote") }
  scope :unknown, -> { where({ decision: ["abstain", "notvote"]}) }

  def self.get_standpoint(party, issue)
    where("party_id = ? AND issue_id = ?", party.id, issue.id).first
  end

  def self.get_issue(issue)
    includes(:parties).where(issue_id: issue.id).first
  end
end
