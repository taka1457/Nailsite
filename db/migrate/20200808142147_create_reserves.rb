class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.references :customer, foreign_key: true, null: false
      t.date :reservation_date, null: false
      t.time :reservation_time, null: false

      t.timestamps
    end
  end
end
