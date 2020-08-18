class AddBookmarkToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :bookmark_id, :integer
    add_column :bookmarks, :unbookmark_id, :integer
  end
end
