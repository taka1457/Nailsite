class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :name, null: false
      t.string :detail
      t.integer :price, null: false
      t.string :menu_image_id

      t.timestamps
    end
  end
end
