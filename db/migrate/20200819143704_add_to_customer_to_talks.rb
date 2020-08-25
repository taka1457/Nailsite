class AddToCustomerToTalks < ActiveRecord::Migration[5.2]
  def change
  	add_column :talks, :to_customer, :integer
  end
end
