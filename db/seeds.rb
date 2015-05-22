# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_onomatopoeia(data)
  category = Category.find_by_name(data[:category])
  unless category
    category = Category.create(name: data[:category])
  end

  onomatopoeia = category.onomatopoeias.create
  if category.onomatopoeia.nil?
    category.update(onomatopoeia: onomatopoeia)
  end

  synonym = onomatopoeia.synonyms.create(
    name: data[:name])
  onomatopoeia.update(top_synonym_id: synonym.id)

  p data[:name]
  unless data[:synonyms].nil?
    p data[:synonyms]
    data[:synonyms].each{|name|onomatopoeia.synonyms.create!(name: name)}
  end

  illustration = onomatopoeia.illustrations.create(
    image: seed_image(data[:name]))

  explanation = onomatopoeia.explanations.create(
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

create_onomatopoeia(
  name: 'KABOOM',
  synonyms: ['BOOM'],
  category: 'Explosion',
  outline: 'Explosion.',
  description: 'Explosion. Explosion. **Explosion**. Explosion. Explosion.'
)
create_onomatopoeia(
  name: 'THUMP',
  category: 'Object',
  outline: 'Sitting down.',
  description: 'What!? From a standing position! Such jumping power in his knees alone!'
)
create_onomatopoeia(
  name: 'CHEER',
  category: 'Emotion',
  outline: 'Happy.',
  description: 'Ha-ha-ha.'
)
create_onomatopoeia(
  name: 'SOB',
  category: 'Emotion',
  outline: 'Sad.',
  description: 'Sick sick...'
)
create_onomatopoeia(
  name: 'CRASH',
  category: 'Object',
  outline: 'Something is broken.',
  description: 'Broken heart.'
)
create_onomatopoeia(
  name: 'WOOF',
  category: 'Animal',
  outline: 'By doggie.',
  description: 'Woof! Bow wow! Wang wang!'
)
