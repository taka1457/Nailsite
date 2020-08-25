class RemoveGenreFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :genre, :string
  end
end
