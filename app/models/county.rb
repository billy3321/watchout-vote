class County < ActiveRecord::Base
  has_many :districts, throught: :constituencies
  has_many :constituencies
end
