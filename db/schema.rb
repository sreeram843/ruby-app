# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_11_062512) do
  create_table "practitioners", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "active", default: "true"
    t.string "family_name"
    t.string "given_name"
    t.string "prefix"
    t.string "suffix"
    t.string "gender"
    t.date "birth_date"
    t.text "telecom"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_practitioners_on_identifier", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "practitioner_id", null: false
    t.datetime "start_time", precision: nil, null: false
    t.datetime "end_time", precision: nil, null: false
    t.string "schedule_type", null: false
    t.string "recurrence_rule"
    t.date "recurrence_end_date"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practitioner_id"], name: "index_schedules_on_practitioner_id"
  end

  add_foreign_key "schedules", "practitioners"
end
