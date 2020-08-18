class ChangeBookmarksColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
  	change_column :bookmarks, :customer_id ,:integer, null: true
  	change_column :bookmarks, :shop_id ,:integer, null: true
  end
end
