class ForbidOnomatopeNilForIllustrations < ActiveRecord::Migration
  def up
    Onomatope.create( name: 'KABOOM' ) if Onomatope.count < 1
    onomatope = Onomatope.first
    Illustration.all.each do |illustration|
      illustration.update( onomatope: onomatope )
    end
    change_column :illustrations, :onomatope_id, :integer, null: false
  end

  def down
    change_column :illustrations, :onomatope_id, :integer, null: true
  end
end
