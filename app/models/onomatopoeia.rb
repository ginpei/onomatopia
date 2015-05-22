class Onomatopoeia < ActiveRecord::Base
  belongs_to :category
  has_many :illustrations
  has_many :explanations
  has_many :synonyms

  def self.find_by_name(name)
    synonym = Synonym.find_by_name(name)
    if synonym
      synonym.onomatopoeia
    else
      nil
    end
  end

  def self.search(keyword)
    Synonym.where('name like ?', "%#{keyword.upcase}%")
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
