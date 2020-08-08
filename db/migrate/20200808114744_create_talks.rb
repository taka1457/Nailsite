class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.references :customer, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :talk_room, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
