class Constituency < ActiveRecord::Base
  belongs_to :county
  has_many :districts
  has_many :legislators, class_name: 'Candidate', foreign_key: 'eight_constituency_id'
  has_many :candidates,  class_name: 'Candidate', foreign_key: 'nine_constituency_id'

  def full_name
    if self.county
      "#{self.county.name} #{self.name}"
    else
      self.name
    end
  end
end
