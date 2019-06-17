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

ActiveRecord::Schema.define(version: 2019_06_17_062257) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "prefecture_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "second_category_id"
    t.bigint "third_category_id"
    t.bigint "brand_id"
    t.bigint "size_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["second_category_id"], name: "index_items_on_second_category_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["third_category_id"], name: "index_items_on_third_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "prefecture_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "second_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "first_category_id"
    t.bigint "size_category_id"
    t.bigint "item_id"
    t.string "second_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_category_id"], name: "index_second_categories_on_first_category_id"
    t.index ["item_id"], name: "index_second_categories_on_item_id"
    t.index ["size_category_id"], name: "index_second_categories_on_size_category_id"
  end

  create_table "size_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size", null: false
    t.bigint "size_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_category_id"], name: "index_sizes_on_size_category_id"
  end

  create_table "third_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "third_category", null: false
    t.bigint "second_category_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_third_categories_on_item_id"
    t.index ["second_category_id"], name: "index_third_categories_on_second_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_kana", null: false
    t.string "first_kana", null: false
    t.integer "birth_year", null: false
    t.integer "birth_month", null: false
    t.integer "birth_day", null: false
    t.text "profile"
    t.string "prefecture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "brands"
  add_foreign_key "items", "second_categories"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "third_categories"
  add_foreign_key "items", "users"
  add_foreign_key "second_categories", "first_categories"
  add_foreign_key "second_categories", "items"
  add_foreign_key "second_categories", "size_categories"
  add_foreign_key "sizes", "size_categories"
  add_foreign_key "third_categories", "items"
  add_foreign_key "third_categories", "second_categories"
end
