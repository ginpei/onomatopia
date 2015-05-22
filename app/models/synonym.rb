class Synonym < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :onomatopoeia

  def name=(s)
    write_attribute(:name, s.upcase)
  end
end
