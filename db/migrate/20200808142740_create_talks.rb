class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :shop, foreign_key: true
      t.references :talk_room, foreign_key: true, null: false
      t.string :body, null: false
      t.integer :contributor, null: false, default: 0
      t.integer :to_customer
      t.timestamps
    end
  end
end
