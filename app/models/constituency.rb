class Constituency < ActiveRecord::Base
  belongs_to :county
  has_many :districts
end
