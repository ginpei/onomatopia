class AddOnomatopeColumnToIllustrations < ActiveRecord::Migration
  def change
    add_column :illustrations, :onomatope_id, :integer, index: true
    add_foreign_key :illustrations, :onomatopes
  end
end
