# frozen_string_literal: true

class DeviseCreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string :name, null: false
      t.string :phone_number, null: false
      t.integer :postal_code, null: false
      t.string :prefecture_code, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :other_address, null: false
      t.string :traffic_method, null: false
      t.string :business_hours, null: false
      t.integer :budget, null: false
      t.string :payment_method, null: false
      t.integer :seat, null: false
      t.integer :staff, null: false
      t.string :parking, null: false
      t.text :promotion, null: false
      t.text :introduction, null: false
      t.string :shop_image_id, null: false
      t.integer :genre, null: false, default: 0
      t.boolean :is_active, null: false, default: true

      t.timestamps null: false
    end

    add_index :shops, :email,                unique: true
    add_index :shops, :reset_password_token, unique: true
    # add_index :shops, :confirmation_token,   unique: true
    # add_index :shops, :unlock_token,         unique: true
  end
end
