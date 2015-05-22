# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_onomatope(data)
  category = Category.find_by_name(data[:category])
  unless category
    category = Category.create(name: data[:category])
  end

  onomatope = category.onomatopes.create
  if category.onomatope.nil?
    category.update(onomatope: onomatope)
  end

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

# categories:
# Explosion 爆発
# Living 生活
# Animal 生物音
# Action 動作音
# Atomoshphere 雰囲気・情景
# Looks 様子・見た目
# Object 効果・機械音
# Emotion 感情

create_onomatope(
  name: 'KABOOM',
  synonyms: ['BOOM'],
  category: 'Explosion',
  outline: 'Explosion.',
  description: 'Explosion. Explosion. **Explosion**. Explosion. Explosion.'
)
create_onomatope(
  name: 'THUMP',
  outline: 'Sitting down.',
  category: 'Object',
  description: 'What!? From a standing position! Such jumping power in his knees alone!'
)
create_onomatope(
  name: 'CHEER',
  outline: 'Happy.',
  category: 'Emotion',
  description: 'Ha-ha-ha.'
)
create_onomatope(
  name: 'SOB',
  outline: 'Sad.',
  category: 'Emotion',
  description: 'Sick sick...'
)
create_onomatope(
  name: 'CRASH',
  outline: 'Something is broken.',
  category: 'Object',
  description: 'Broken heart.'
)
create_onomatope(
  name: 'WOOF',
  outline: 'By doggie.',
  category: 'Animal',
  description: 'Woof! Bow wow! Wang wang!'
)
