# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_30_232054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "helps", force: :cascade do |t|
    t.string "help_type"
    t.string "title"
    t.text "description"
    t.string "fullname"
    t.string "email"
    t.string "cellphone"
    t.string "alternative_cellphone"
    t.string "province"
    t.string "county"
    t.string "district"
    t.string "neighborhood"
    t.string "address"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_helps_on_email"
    t.index ["status"], name: "index_helps_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  create_table "volunteer_helps", force: :cascade do |t|
    t.bigint "volunteer_id", null: false
    t.bigint "help_id", null: false
    t.boolean "anonymous"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["help_id"], name: "index_volunteer_helps_on_help_id"
    t.index ["volunteer_id"], name: "index_volunteer_helps_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "password_digest"
    t.string "cellphone"
    t.string "types_of_availability"
    t.string "province"
    t.string "county"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cellphone"], name: "index_volunteers_on_cellphone", unique: true
    t.index ["email"], name: "index_volunteers_on_email", unique: true
  end

  add_foreign_key "volunteer_helps", "helps"
  add_foreign_key "volunteer_helps", "volunteers"
end
