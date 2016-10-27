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

ActiveRecord::Schema.define(version: 20161026111903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["key"], name: "index_api_keys_on_key", using: :btree
    t.index ["user_id"], name: "index_api_keys_on_user_id", using: :btree
  end

  create_table "avatars", force: :cascade do |t|
    t.string   "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_avatars_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "author"
    t.date     "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "post_id"
    t.index ["author"], name: "index_comments_on_author", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "author"
    t.date     "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author"], name: "index_posts_on_author", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
