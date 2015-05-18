class AddTopSynonimToOnomatope < ActiveRecord::Migration
  def up
    add_column :onomatopes, :top_synonym_id, :int
    Onomatope.all.each do |onomatope|
      top = Synonym.find_by_name(onomatope.name)
      if top.nil?
        top = Synonym.create(onomatope: onomatope, name: onomatope.name)
      end
      onomatope.update(top_synonym_id: top.id)
    end
    change_column :onomatopes, :top_synonym_id, :int, null: false
    remove_column :onomatopes, :name
  end

  def down
    add_column :onomatopes, :name, :string
    Onomatope.all.each do |onomatope|
      top = Synonym.find(onomatope.top_synonym_id)
      onomatope.update(name: top.name)
      top.destroy
    end
    change_column :onomatopes, :name, :string, null: false
    remove_column :onomatopes, :top_synonym_id
  end
end
