class Category < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :onomatope
  has_many :onomatopes
end
