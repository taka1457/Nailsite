class CreateReservationHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_histories do |t|
      t.references :reserve, foreign_key: true
      t.references :menu, foreign_key: true
      t.integer :reservation_price

      t.timestamps
    end
  end
end
