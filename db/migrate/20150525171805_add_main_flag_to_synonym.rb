class AddMainFlagToSynonym < ActiveRecord::Migration
  def change
    add_column :synonyms, :main, :boolean
    remove_column :onomatopoeias, :top_synonym_id, :integer
  end
end
