class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.references :onomatope, index: true
      t.string :outline
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :explanations, :onomatopes
  end
end
