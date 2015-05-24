class AddLocaleToEachModels < ActiveRecord::Migration
  def up
    add_column :synonyms, :locale, :string, null: false, default: 'en'
    change_column :synonyms, :locale, :string, null: false

    add_column :illustrations, :locale, :string, null: false, default: 'en'
    change_column :illustrations, :locale, :string, null: false

    add_column :explanations, :locale, :string, null: false, default: 'en'
    change_column :explanations, :locale, :string, null: false
  end

  def down
    remove_column :synonyms, :locale
    remove_column :illustrations, :locale
    remove_column :explanations, :locale
  end
end
