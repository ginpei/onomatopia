class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
  has_many :illustrations

  def name=(s)
    write_attribute(:name, s.upcase)
  end

  def to_param
    name
  end
end
