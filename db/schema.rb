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

ActiveRecord::Schema.define(version: 20170316162326) do

  create_table "actions", force: :cascade do |t|
    t.string   "act_type"
    t.date     "act_date"
    t.text     "act_result"
    t.string   "act_next"
    t.date     "act_next_due_date"
    t.integer  "contact_id",        default: 0
    t.integer  "company_id",        default: 0
    t.integer  "job_id",            default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "city"
    t.string   "state"
    t.string   "url"
    t.integer  "employees"
    t.integer  "revenue"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "company_id", default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.text     "about"
    t.string   "email"
    t.string   "phone"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "blog"
    t.string   "website"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.string  "url"
    t.string  "company_id"
    t.string  "contact_id",   default: "0"
    t.text    "instructions"
    t.text    "requirements"
    t.integer "learning",     default: 0
    t.integer "skills",       default: 0
    t.integer "networking",   default: 0
    t.integer "location",     default: 0
    t.integer "salary",       default: 0
  end

  create_table "pdfs", force: :cascade do |t|
    t.text     "name"
    t.string   "location",   default: "app/assets/pdfs"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
