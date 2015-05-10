class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
  has_many :illustrations

  def to_param
    name
  end
end
