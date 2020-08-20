class CreateShopRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_rooms do |t|
      t.references :shop, foreign_key: true, null: false
      t.references :talk_room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
