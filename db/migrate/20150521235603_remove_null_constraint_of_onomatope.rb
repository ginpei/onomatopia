class RemoveNullConstraintOfOnomatope < ActiveRecord::Migration
  def up
    change_column :onomatopes, :top_synonym_id, :integer, null: true
  end

  def down
    change_column :onomatopes, :top_synonym_id, :integer, null: false
  end
end
