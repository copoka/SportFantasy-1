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

ActiveRecord::Schema.define(version: 20141027093512) do

  create_table "ampluas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "real_team_id"
    t.integer  "amplua_id"
    t.float    "price"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["amplua_id"], name: "index_players_on_amplua_id"
  add_index "players", ["real_team_id"], name: "index_players_on_real_team_id"

  create_table "real_teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_team_players", force: true do |t|
    t.integer  "user_team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_team_players", ["player_id"], name: "index_user_team_players_on_player_id"
  add_index "user_team_players", ["user_team_id"], name: "index_user_team_players_on_user_team_id"

  create_table "user_teams", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
