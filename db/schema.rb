# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_23_090857) do

  create_table "admin", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_on_reset_password_token", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookmarks_on_customer_id"
    t.index ["shop_id"], name: "index_bookmarks_on_shop_id"
  end

  create_table "customer_rooms", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "talk_room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_rooms_on_customer_id"
    t.index ["talk_room_id"], name: "index_customer_rooms_on_talk_room_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.text "introduction"
    t.string "profile_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["post_id"], name: "index_favorites_on_post_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_void_flag", default: true, null: false
    t.string "genre_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_comments", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "reservation_history_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_history_comments_on_customer_id"
    t.index ["reservation_history_id"], name: "index_history_comments_on_reservation_history_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false
    t.string "detail"
    t.integer "price", null: false
    t.string "menu_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_menus_on_shop_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "post_id", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_post_comments_on_customer_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "body"
    t.string "post_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_posts_on_shop_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_histories", force: :cascade do |t|
    t.integer "reserve_id", null: false
    t.integer "menu_id", null: false
    t.integer "reservation_price", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_reservation_histories_on_menu_id"
    t.index ["reserve_id"], name: "index_reservation_histories_on_reserve_id"
  end

  create_table "reservation_menus", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "menu_id", null: false
    t.string "reservation_shop", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservation_menus_on_customer_id"
    t.index ["menu_id"], name: "index_reservation_menus_on_menu_id"
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "reservation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reserves_on_customer_id"
  end

  create_table "shop_rooms", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "talk_room_id", null: false
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shop_rooms_on_customer_id"
    t.index ["shop_id"], name: "index_shop_rooms_on_shop_id"
    t.index ["talk_room_id"], name: "index_shop_rooms_on_talk_room_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "phone_number", null: false
    t.integer "postal_code", null: false
    t.string "prefecture_code", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "other_address"
    t.string "traffic_method", null: false
    t.string "business_hours", null: false
    t.integer "budget", null: false
    t.string "payment_method", null: false
    t.integer "seat", null: false
    t.integer "staff", null: false
    t.string "parking", null: false
    t.text "promotion"
    t.text "introduction"
    t.string "shop_image_id"
    t.string "genre", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["genre_id"], name: "index_shops_on_genre_id"
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

  create_table "talk_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "shop_id"
    t.integer "talk_room_id", null: false
    t.string "body", null: false
    t.integer "contributor", null: false
    t.integer "to_customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_talks_on_customer_id"
    t.index ["shop_id"], name: "index_talks_on_shop_id"
    t.index ["talk_room_id"], name: "index_talks_on_talk_room_id"
  end

end
