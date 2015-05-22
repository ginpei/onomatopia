class RenameOnomatopeToOnomatopoeia < ActiveRecord::Migration
  def change
    rename_table :onomatopes, :onomatopoeia
  end
end
