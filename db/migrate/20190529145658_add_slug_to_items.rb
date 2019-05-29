class AddSlugToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :slug, :string
    add_index :items, :slug, unique: true
  end
end
