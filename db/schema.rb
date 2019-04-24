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

ActiveRecord::Schema.define(version: 2019_04_24_194119) do

  create_table "game_picks", force: :cascade do |t|
    t.string "team1"
    t.string "team2"
    t.integer "week"
    t.string "pickedteam"
    t.integer "spread"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "gamedatetime"
    t.integer "user_id"
    t.index ["team1", "team2", "week"], name: "index_game_picks_on_team1_and_team2_and_week", unique: true
    t.index ["user_id"], name: "index_game_picks_on_user_id"
  end

  create_table "league_memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_memberships_on_league_id"
    t.index ["user_id"], name: "index_league_memberships_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standings", force: :cascade do |t|
    t.integer "place"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "league_id"
    t.index ["league_id"], name: "index_standings_on_league_id"
    t.index ["place"], name: "index_standings_on_place", unique: true
    t.index ["user_id"], name: "index_standings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "fname"
    t.string "lname"
    t.integer "gender"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
