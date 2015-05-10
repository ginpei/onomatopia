class ChangeColumnOfOnomatope < ActiveRecord::Migration
  def change
    change_column :onomatopes, :name, :string, null: false
  end
end
