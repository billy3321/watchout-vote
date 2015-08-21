class Question < ActiveRecord::Base
  belongs_to :issue
  has_many :clarifies
end
