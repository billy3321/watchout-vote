class AdNineDatum < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :constituency
end
