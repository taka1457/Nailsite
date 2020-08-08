class CreateHistoryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :history_comments do |t|
      t.references :customer, foreign_key: true
      t.references :reservation_history, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
