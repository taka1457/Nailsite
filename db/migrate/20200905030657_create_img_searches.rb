class CreateImgSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :img_searches do |t|
      t.references :customer, foreign_key: true
      t.string :search_image_id

      t.timestamps
    end
  end
end
