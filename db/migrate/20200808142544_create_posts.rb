class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :body
      t.string :post_image_id

      t.timestamps
    end
  end
end
