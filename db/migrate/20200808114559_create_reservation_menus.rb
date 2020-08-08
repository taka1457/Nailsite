class CreateReservationMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_menus do |t|
      t.references :customer, foreign_key: true
      t.references :menu, foreign_key: true
      t.string :reservation_shop

      t.timestamps
    end
  end
end
