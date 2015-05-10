class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
end
