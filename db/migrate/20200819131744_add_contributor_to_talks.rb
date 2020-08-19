class AddContributorToTalks < ActiveRecord::Migration[5.2]
  def change
  	add_column :talks, :contributor, :integer, null: false, default: 0
  end
end
