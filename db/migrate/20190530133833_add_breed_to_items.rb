class AddBreedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :breed, :string
  end
end
