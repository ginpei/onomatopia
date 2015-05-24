class RemoveDefaultFromLocales < ActiveRecord::Migration
  def up
    change_column :synonyms, :locale, :string, default: nil
    change_column :illustrations, :locale, :string, default: nil
    change_column :explanations, :locale, :string, default: nil
  end

  def down
    change_column :synonyms, :locale, :string, default: 'en'
    change_column :illustrations, :locale, :string, default: 'en'
    change_column :explanations, :locale, :string, default: 'en'
  end
end
