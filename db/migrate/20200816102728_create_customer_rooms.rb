class CreateCustomerRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_rooms do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :talk_room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
