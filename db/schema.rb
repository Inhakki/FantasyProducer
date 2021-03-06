# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140529024440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draft_picks", force: true do |t|
    t.integer "game_id"
    t.integer "movie_id"
  end

  create_table "games", force: true do |t|
    t.string  "groupname"
    t.integer "max_members"
    t.boolean "is_public",   default: true
  end

  add_index "games", ["groupname"], name: "index_games_on_groupname", unique: true, using: :btree

  create_table "memberships", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "movies", force: true do |t|
    t.string  "title"
    t.integer "year"
    t.float   "budget"
    t.float   "gross"
    t.text    "img_url"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
  end

end
