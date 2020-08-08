class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
