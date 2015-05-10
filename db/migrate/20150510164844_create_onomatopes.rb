class CreateOnomatopes < ActiveRecord::Migration
  def change
    create_table :onomatopes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
