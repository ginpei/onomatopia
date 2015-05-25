class Onomatopoeia < ActiveRecord::Base
  belongs_to :category
  has_many :illustrations
  has_many :explanations
  has_many :synonyms

  attr_accessor :locale
  after_initialize :set_default_locale

  def keyphrase=(s)
    write_attribute(:keyphrase, s.upcase)
  end

  def self.find_by_name(name)
    synonym = Synonym.find_by_name(name)
    if synonym
      synonym.onomatopoeia
    else
      nil
    end
  end

  def self.search(keyword)
    if keyword and keyword.present?
      Synonym.where('name like ?', "%#{keyword.upcase}%")
    else
      nil
    end
  end

  def top_synonym
    synonyms.where({main: true, locale: @locale}).first
  end

  def top_illustration
    illustrations.first
  end

  def top_explanation
    explanations.where({locale: @locale}).first
  end

  def name
    top_synonym.name
  end

  def to_param
    name
  end

  private
    def set_default_locale
      @locale = I18n.default_locale
    end
end
