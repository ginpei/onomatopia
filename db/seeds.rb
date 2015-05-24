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

locale = 'en'
yml = File.read("#{Rails.root}/db/seeds/#{locale}.yml")
seeds = YAML.load(yml)
seeds.each do |category_name, onomatopoeias|
  category = Category.create(name: category_name)
  onomatopoeias.each do |data|
    onomatopoeia = category.onomatopoeias.create
    data['synonyms'].each{ |name| onomatopoeia.synonyms.create(name: name)}
    data['description'].each{ |text| onomatopoeia.explanations.create(description: text)}

    image = seed_image(data['synonyms'].first.upcase)
    if image
      illustration = onomatopoeia.illustrations.create(image: image)
    end

    onomatopoeia.update(top_synonym_id: onomatopoeia.synonyms.first.id)
  end
end
