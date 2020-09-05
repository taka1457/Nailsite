class CreateSearchTags < ActiveRecord::Migration[5.2]
  def change
    create_table :search_tags do |t|
      t.string :name
      t.integer :img_search_id

      t.timestamps
    end
  end
end
