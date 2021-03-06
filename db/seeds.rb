# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_image(name)
  path = File.join(Rails.root, "/db/seeds/images/#{name}.png")
  if File.exist? path
    File.open(path)
  else
    nil
  end
end

['en', 'ja'].each do |locale|
  # load data
  yml = File.read("#{Rails.root}/db/seeds/#{locale}.yml")
  seeds = YAML.load(yml)
  seeds.each do |category_name, onomatopoeias|
    # category
    category = Category.find_by_name(category_name)
    unless category
      category = Category.create(name: category_name)
    end

    onomatopoeias.each do |keyphrase, data|
      # onomatopoeia
      onomatopoeia = Onomatopoeia.find_by_keyphrase(keyphrase.upcase)
      unless onomatopoeia
        onomatopoeia = category.onomatopoeias.create(keyphrase: keyphrase)
        if category.onomatopoeia.nil?
          category.update(onomatopoeia: onomatopoeia)
        end
      end

      # texts
      data['synonyms'].each{ |name| onomatopoeia.synonyms.create(locale: locale, name: name)}
      data['description'].each{ |text| onomatopoeia.explanations.create(locale: locale, description: text)}
      onomatopoeia.synonyms.where(locale:locale).first.update(main: true)

      # illustration
      image = seed_image(data['synonyms'].first.upcase)
      onomatopoeia.illustrations.create(locale: locale, image: image) unless image.nil?
    end
  end
end
