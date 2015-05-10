class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
  def to_param
    name
  end
end
