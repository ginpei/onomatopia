class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
  has_many :illustrations
  has_many :explanations

  def name=(s)
    write_attribute(:name, s.upcase)
  end

  def top_illustration
    illustrations.first
  end

  def top_explanation
    explanations.first
  end

  def to_param
    name
  end
end
