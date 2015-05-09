class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
