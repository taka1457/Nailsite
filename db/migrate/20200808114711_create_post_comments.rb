class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :customer, foreign_key: true
      t.references :post, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
