class RemoveBookmarkFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :bookmark_id, :integer
    remove_column :bookmarks, :unbookmark_id, :integer
  end
end
