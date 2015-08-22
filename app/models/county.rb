class County < ActiveRecord::Base
  has_many :districts, through: :constituencies
  has_many :constituencies
end
