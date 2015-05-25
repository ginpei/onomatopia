class AddKeyphraseToOnomatope < ActiveRecord::Migration
  def change
    add_column :onomatopoeias, :keyphrase, :string, unique: true
    add_index :onomatopoeias, :keyphrase
  end
end
