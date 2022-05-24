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

ActiveRecord::Schema.define(version: 2022_02_13_084211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "to", null: false
    t.string "from", null: false
    t.string "status", default: "available", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parcels", force: :cascade do |t|
    t.float "weight", null: false
    t.float "volume", null: false
    t.string "shipping_address", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parcels_on_user_id"
  end

  create_table "train_availabilities", force: :cascade do |t|
    t.string "from", null: false
    t.string "to", null: false
    t.datetime "departure_time", null: false
    t.datetime "arrival_time", null: false
    t.bigint "train_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["train_id"], name: "index_train_availabilities_on_train_id"
  end

  create_table "train_bids", force: :cascade do |t|
    t.string "status"
    t.bigint "train_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["train_id"], name: "index_train_bids_on_train_id"
    t.index ["user_id"], name: "index_train_bids_on_user_id"
  end

  create_table "train_lines", force: :cascade do |t|
    t.string "status", default: "unassigned", null: false
    t.bigint "train_id", null: false
    t.bigint "line_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_id"], name: "index_train_lines_on_line_id"
    t.index ["train_id"], name: "index_train_lines_on_train_id"
  end

  create_table "train_parcels", force: :cascade do |t|
    t.string "status"
    t.bigint "train_id", null: false
    t.bigint "parcel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parcel_id"], name: "index_train_parcels_on_parcel_id"
    t.index ["train_id"], name: "index_train_parcels_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "name", null: false
    t.float "maximum_weight", null: false
    t.float "maximum_volume", null: false
    t.float "cost", null: false
    t.string "status", default: "not_booked"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trains_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "parcels", "users"
  add_foreign_key "train_availabilities", "trains"
  add_foreign_key "train_bids", "trains"
  add_foreign_key "train_bids", "users"
  add_foreign_key "train_lines", "lines"
  add_foreign_key "train_lines", "trains"
  add_foreign_key "train_parcels", "parcels"
  add_foreign_key "train_parcels", "trains"
  add_foreign_key "trains", "users"
end
