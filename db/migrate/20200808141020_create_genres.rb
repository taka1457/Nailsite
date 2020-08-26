class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
    	t.string :name, null: false
    	t.boolean :is_void_flag, default: true, null: false
    	t.string :genre_image_id
      t.timestamps
    end
  end
end
