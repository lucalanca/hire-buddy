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

ActiveRecord::Schema.define(version: 20131117190849) do

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.string   "current_position"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviewers", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", force: true do |t|
    t.string   "position"
    t.string   "state"
    t.integer  "candidate_id"
    t.integer  "interviewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interviews", ["candidate_id"], name: "index_interviews_on_candidate_id"
  add_index "interviews", ["interviewer_id"], name: "index_interviews_on_interviewer_id"

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "difficulty"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
