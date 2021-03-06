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

ActiveRecord::Schema.define(version: 20170618165141) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "swit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_comments_on_swit_id"
    t.index ["user_id", "swit_id", "created_at"], name: "index_comments_on_user_id_and_swit_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "sours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "swit_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_sours_on_swit_id"
    t.index ["user_id"], name: "index_sours_on_user_id"
  end

  create_table "sweets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "swit_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swit_id"], name: "index_sweets_on_swit_id"
    t.index ["user_id"], name: "index_sweets_on_user_id"
  end

  create_table "swits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_swits_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_swits_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "swits"
  add_foreign_key "comments", "users"
  add_foreign_key "sours", "swits"
  add_foreign_key "sours", "users"
  add_foreign_key "sweets", "swits"
  add_foreign_key "sweets", "users"
  add_foreign_key "swits", "users"
end
