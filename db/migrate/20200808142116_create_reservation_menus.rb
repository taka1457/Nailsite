class CreateReservationMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_menus do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :menu, foreign_key: true, null: false
      t.string :reservation_shop, null: false

      t.timestamps
    end
  end
end
