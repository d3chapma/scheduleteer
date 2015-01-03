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

ActiveRecord::Schema.define(version: 20150103153328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "score"
    t.boolean  "confirmed",    default: false
    t.boolean  "absent",       default: false
    t.integer  "volunteer_id"
    t.integer  "day_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["day_id"], name: "index_assignments_on_day_id", using: :btree
  add_index "assignments", ["job_id"], name: "index_assignments_on_job_id", using: :btree
  add_index "assignments", ["volunteer_id"], name: "index_assignments_on_volunteer_id", using: :btree

  create_table "days", force: true do |t|
    t.date     "date"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["schedule_id"], name: "index_days_on_schedule_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["event_id"], name: "index_jobs_on_event_id", using: :btree

  create_table "jobs_volunteers", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "volunteer_id"
  end

  create_table "schedules", force: true do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "schedules", ["event_id"], name: "index_schedules_on_event_id", using: :btree

  create_table "volunteers", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["event_id"], name: "index_volunteers_on_event_id", using: :btree

end
