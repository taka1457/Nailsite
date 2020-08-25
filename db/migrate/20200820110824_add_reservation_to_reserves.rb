class AddReservationToReserves < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :reservation, :datetime
  end
end
