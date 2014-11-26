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

ActiveRecord::Schema.define(version: 20141123004949) do

  create_table "ampluas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "team_home_id"
    t.integer  "team_away_id"
    t.integer  "team_home_score"
    t.integer  "team_away_score"
    t.text     "highlights"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["team_away_id"], name: "index_matches_on_team_away_id"
  add_index "matches", ["team_home_id"], name: "index_matches_on_team_home_id"

  create_table "performances", force: true do |t|
    t.integer  "player_id"
    t.integer  "real_team_id"
    t.integer  "amplua_id"
    t.integer  "for_playing_up_to_60_minutes"
    t.integer  "for_playing_60_minutes_or_more"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "three_saves_gk"
    t.integer  "penalty_save_gk"
    t.integer  "penalty_miss"
    t.integer  "clean_sheet"
    t.integer  "mvps"
    t.integer  "every_two_goals_df_gk"
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.integer  "self_goals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performances", ["amplua_id"], name: "index_performances_on_amplua_id"
  add_index "performances", ["player_id"], name: "index_performances_on_player_id"
  add_index "performances", ["real_team_id"], name: "index_performances_on_real_team_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "real_team_id"
    t.integer  "amplua_id"
    t.float    "price"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "past_score_1", default: 0
    t.integer  "past_score_2", default: 0
    t.integer  "past_score_3", default: 0
    t.integer  "past_score_4", default: 0
  end

  add_index "players", ["amplua_id"], name: "index_players_on_amplua_id"
  add_index "players", ["real_team_id"], name: "index_players_on_real_team_id"

  create_table "real_teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "total_performances", force: true do |t|
    t.integer  "player_id"
    t.integer  "for_playing_up_to_60_minutes"
    t.integer  "for_playing_60_minutes_or_more"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "three_saves_gk"
    t.integer  "penalty_save_gk"
    t.integer  "penalty_miss"
    t.integer  "clean_sheet"
    t.integer  "mvps"
    t.integer  "every_two_goals_df_gk"
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.integer  "self_goals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "total_performances", ["player_id"], name: "index_total_performances_on_player_id"

  create_table "user_team_players", force: true do |t|
    t.integer  "user_team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "first_team",   default: false, null: false
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
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
