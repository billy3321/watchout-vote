class Committee < ActiveRecord::Base
  has_and_belongs_to_many :candidates, -> { uniq }
end