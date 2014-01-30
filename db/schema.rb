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

ActiveRecord::Schema.define(version: 20140102100029) do

  create_table "events", force: true do |t|
    t.string   "eventname"
    t.string   "category"
    t.datetime "registrationopen"
    t.datetime "registrationclose"
    t.datetime "auditionopen"
    t.datetime "auditionclose"
    t.datetime "eventopen"
    t.datetime "eventclose"
    t.string   "description"
    t.string   "rules"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloud_url"
  end

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "role"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "dob"
    t.integer  "age"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.string   "password"
    t.string   "likes"
    t.string   "dislikes"
    t.string   "ambition"
    t.string   "talent"
    t.string   "aboutme"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "mobile"
    t.string   "gplus"
    t.string   "user_cloud_url"
    t.string   "hangouturl"
  end

end
