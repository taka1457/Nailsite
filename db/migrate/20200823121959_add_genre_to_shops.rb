class AddGenreToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :genre, foreign_key: true
  end
end
