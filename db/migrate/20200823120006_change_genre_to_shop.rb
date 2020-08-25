class ChangeGenreToShop < ActiveRecord::Migration[5.2]
  def change
  	change_column :shops, :genre, :string, null: false
  end
end
