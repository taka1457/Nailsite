class AddCustomerToShopRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_rooms, :customer, foreign_key: true
  end
end
