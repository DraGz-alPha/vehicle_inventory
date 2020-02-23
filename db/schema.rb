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

ActiveRecord::Schema.define(version: 2020_02_23_052218) do

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "prefix"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parking_tickets", force: :cascade do |t|
    t.string "ticket_number"
    t.string "violation"
    t.string "street"
    t.string "latitude"
    t.string "longitude"
    t.decimal "discounted_price"
    t.decimal "full_price"
    t.datetime "issue_date"
    t.integer "owner_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_parking_tickets_on_owner_id"
    t.index ["vehicle_id"], name: "index_parking_tickets_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "transmission_type"
    t.integer "year"
    t.string "engine_size"
    t.integer "kilometrage"
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_vehicles_on_owner_id"
  end

  add_foreign_key "parking_tickets", "owners"
  add_foreign_key "parking_tickets", "vehicles"
  add_foreign_key "vehicles", "owners"
end
