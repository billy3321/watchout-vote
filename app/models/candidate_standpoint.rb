class CandidateStandpoint < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
  validates_presence_of :candidate_id, message: '請選擇候選人'
  validates_presence_of :issue_id, message: '請選擇議題'
  validates_presence_of :agree, message: '請填寫同意比例'
  validates_presence_of :disagree, message: '請填寫反對比例'
  validates_presence_of :abstain, message: '請填寫棄權比例'
  validates_presence_of :notvote, message: '請填寫未投票比例'
end
