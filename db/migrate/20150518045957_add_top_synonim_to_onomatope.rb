class AddTopSynonimToOnomatope < ActiveRecord::Migration
  def up
    add_column :onomatopes, :top_synonym_id, :int, default: 1
    change_column :onomatopes, :top_synonym_id, :int, default: nil, null: false
    remove_column :onomatopes, :name
  end

  def down
    add_column :onomatopes, :name, :string, default: 'KABOOM'
    change_column :onomatopes, :name, :string, default: nil, null: false
    remove_column :onomatopes, :top_synonym_id
  end
end
