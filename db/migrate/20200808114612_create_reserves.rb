class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.references :customer, foreign_key: true
      t.date :reservation_date
      t.time :reservation_time

      t.timestamps
    end
  end
end
