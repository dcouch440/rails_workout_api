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

ActiveRecord::Schema.define(version: 2021_08_18_031501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.date "hired"
    t.bigint "gym_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.index ["gym_id"], name: "index_employees_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.date "established"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_gyms_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address"
    t.string "state_province"
    t.string "city"
    t.integer "postal_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.date "signed_up"
    t.boolean "membership"
    t.bigint "gym_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gym_id"], name: "index_members_on_gym_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_shifts_on_employee_id"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_visits_on_member_id"
  end

  add_foreign_key "employees", "gyms"
  add_foreign_key "gyms", "locations"
  add_foreign_key "members", "gyms"
  add_foreign_key "shifts", "employees"
  add_foreign_key "visits", "members"
end
