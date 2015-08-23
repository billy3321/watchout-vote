class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :question
  delegate :issue, to: :question, allow_nil: false
  delegate :party, to: :candidate, allow_nil: false
  validates_presence_of :candidate_id, message: '請選擇候選人'
  validates_presence_of :question_id, message: '請選擇問題'
  validates_presence_of :date, message: '請填寫承諾日期'
  validates_presence_of :answer, message: '請填寫承諾書內容'
  validates_presence_of :summary, message: '請總結立場'
  validates_presence_of :dicision, message: '請選擇承諾狀況'
end
