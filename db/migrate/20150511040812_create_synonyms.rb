class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.references :onomatope, index: true, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
    add_foreign_key :synonyms, :onomatopes
  end
end
