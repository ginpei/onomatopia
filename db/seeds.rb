# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_onomatope(data)
  onomatope = Onomatope.create

  synonym = onomatope.synonyms.create(
    name: data[:name])
  onomatope.update(top_synonym_id: synonym.id)

  p data[:name]
  unless data[:synonyms].nil?
    p data[:synonyms]
    data[:synonyms].each{|name|onomatope.synonyms.create!(name: name)}
  end

  illustration = onomatope.illustrations.create(
    image: seed_image(data[:name]))

  explanation = onomatope.explanations.create(
    outline: data[:outline],
    description: data[:description])
end

def seed_image(name)
  File.open(File.join(Rails.root, "/db/seed_images/#{name}.png"))
end

create_onomatope(
  name: 'KABOOM',
  synonyms: ['BOOM'],
  outline: 'Explosion.',
  description: 'Explosion. Explosion. **Explosion**. Explosion. Explosion.'
)
create_onomatope(
  name: 'THUMP',
  outline: 'Sitting down.',
  description: 'What!? From a standing position! Such jumping power in his knees alone!'
)
create_onomatope(
  name: 'CHEER',
  outline: 'Happy.',
  description: 'Ha-ha-ha.'
)
create_onomatope(
  name: 'SOB',
  outline: 'Sad.',
  description: 'Sick sick...'
)
create_onomatope(
  name: 'CRASH',
  outline: 'Something is broken.',
  description: 'Broken heart.'
)
create_onomatope(
  name: 'WOOF',
  outline: 'By doggie.',
  description: 'Woof! Bow wow! Wang wang!'
)
