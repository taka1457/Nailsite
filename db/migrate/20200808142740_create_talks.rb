class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false
      t.references :talk_room, foreign_key: true, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
