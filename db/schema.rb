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

ActiveRecord::Schema.define(version: 2022_03_02_063338) do

  create_table "appointments", force: :cascade do |t|
    t.integer "event_id"
    t.integer "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status_id", null: false
    t.index ["event_id"], name: "index_appointments_on_event_id"
    t.index ["member_id"], name: "index_appointments_on_member_id"
    t.index ["status_id"], name: "index_appointments_on_status_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_members", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "event_id", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_members_on_event_id"
    t.index ["member_id"], name: "index_event_members_on_member_id"
    t.index ["status_id"], name: "index_event_members_on_status_id"
  end

  create_table "event_part_zones", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "part_id", null: false
    t.integer "zone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_part_zones_on_event_id"
    t.index ["part_id"], name: "index_event_part_zones_on_part_id"
    t.index ["zone_id"], name: "index_event_part_zones_on_zone_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "start"
    t.datetime "end"
    t.text "description"
    t.boolean "isAllday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["member_id"], name: "index_group_members_on_member_id"
  end

  create_table "group_parts", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "part_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_parts_on_group_id"
    t.index ["part_id"], name: "index_group_parts_on_part_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_groups_on_manager_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "grade_id"
    t.integer "schoolname_id"
    t.string "address"
    t.string "homephonenumber"
    t.string "phonenumber"
    t.integer "group_id"
    t.integer "division_id"
    t.integer "zone_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_members_on_division_id"
    t.index ["grade_id"], name: "index_members_on_grade_id"
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["schoolname_id"], name: "index_members_on_schoolname_id"
    t.index ["zone_id"], name: "index_members_on_zone_id"
  end

  create_table "participants", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "note"
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_parts_on_owner_id"
  end

  create_table "schoolnames", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id", null: false
    t.index ["owner_id"], name: "index_zones_on_owner_id"
  end

  add_foreign_key "appointments", "statuses"
  add_foreign_key "event_members", "events"
  add_foreign_key "event_members", "members"
  add_foreign_key "event_members", "statuses"
  add_foreign_key "event_part_zones", "events"
  add_foreign_key "event_part_zones", "parts"
  add_foreign_key "event_part_zones", "zones"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "members"
  add_foreign_key "group_parts", "groups"
  add_foreign_key "group_parts", "parts"
  add_foreign_key "parts", "members", column: "owner_id"
  add_foreign_key "zones", "members", column: "owner_id"
end
