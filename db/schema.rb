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

ActiveRecord::Schema.define(version: 2019_11_05_190326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "residential_address"
    t.string "phone_no"
    t.string "additional_phone_no"
    t.string "email_address"
    t.boolean "marital_status"
    t.string "name_of_spouse"
    t.date "wedding_anniversary"
    t.date "date_born_again"
    t.date "date_joined_christ_embassy"
    t.string "current_local_church"
    t.boolean "water_baptized"
    t.date "date_water_baptized"
    t.boolean "completed_foundation_school"
    t.date "date_completed_foundation_school"
    t.jsonb "family", default: {}
    t.jsonb "previous_membership", default: {}
    t.string "title"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "home_address"
    t.string "designation"
    t.string "cell"
    t.string "chapter"
    t.string "zone"
    t.jsonb "current_employment", default: {}
    t.jsonb "academic_qualifications", default: {}
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
