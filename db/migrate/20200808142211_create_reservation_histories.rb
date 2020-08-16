class CreateReservationHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_histories do |t|
      t.references :reserve, foreign_key: true, null: false
      t.references :menu, foreign_key: true, null: false
      t.integer :reservation_price, null: false

      t.timestamps
    end
  end
end
