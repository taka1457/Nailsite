class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
  	change_column :talks, :shop_id ,:integer, null: true
  end
end
