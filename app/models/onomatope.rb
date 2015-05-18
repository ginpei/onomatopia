class Onomatope < ActiveRecord::Base
  validates :name, :presence => true
  has_many :illustrations
  has_many :explanations
  has_many :synonyms

  def self.find_by_name(name)
    synonym = Synonym.find_by_name(name)
    if synonym
      synonym.onomatope
    else
      nil
    end
  end

  def top_synonym
    Synonym.find(top_synonym_id)
  end

  def top_illustration
    illustrations.first
  end

  def top_explanation
    explanations.first
  end

  def name
    top_synonym.name
  end

  def to_param
    name
  end
end
