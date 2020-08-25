class AddGenreIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :shops, :genre
  end
end
