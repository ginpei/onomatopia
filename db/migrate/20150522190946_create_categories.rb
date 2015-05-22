class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :onomatope, index: true

      t.timestamps null: false
    end
    add_foreign_key :categories, :onomatopes

    add_column :onomatopes, :category_id, :integer
    add_foreign_key :onomatopes, :categories
  end
end
