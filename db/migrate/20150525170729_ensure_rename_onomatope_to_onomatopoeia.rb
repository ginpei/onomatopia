class EnsureRenameOnomatopeToOnomatopoeia < ActiveRecord::Migration
  def change
    rename_table :onomatopoeia, :onomatopoeias
    rename_column :categories, :onomatope_id, :onomatopoeia_id
    rename_column :synonyms, :onomatope_id, :onomatopoeia_id
    rename_column :explanations, :onomatope_id, :onomatopoeia_id
    rename_column :illustrations, :onomatope_id, :onomatopoeia_id
  end
end
