class RemoveReservationDateFromReserves < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserves, :reservation_date, :date
    remove_column :reserves, :reservation_time, :time
  end
end
