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

ActiveRecord::Schema.define(version: 0) do

  create_table "charge", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "charge", limit: 25
  end

  create_table "charge_has_components", primary_key: "charge_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "components_id", null: false
    t.integer "privileges_id", null: false
    t.index ["charge_id"], name: "fk_components_has_charge_charge1_idx", using: :btree
    t.index ["components_id"], name: "fk_components_has_charge_components1_idx", using: :btree
    t.index ["privileges_id"], name: "fk_components_has_charge_privileges1_idx", using: :btree
  end

  create_table "components", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "components", limit: 25
    t.integer  "modules_id",            null: false
    t.string   "icon",       limit: 20
    t.string   "path",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["modules_id"], name: "fk_components_modules1_idx", using: :btree
  end

  create_table "modules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "modules",    limit: 15
    t.string   "icon",       limit: 20
    t.string   "path",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 30
    t.string   "last_name",  limit: 15
    t.string   "slast_name", limit: 15
    t.string   "phone",      limit: 9
    t.string   "email",      limit: 35
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "privileges", limit: 25
  end

  create_table "user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",   limit: 45
    t.string   "password",   limit: 45
    t.integer  "person_id",             null: false, unsigned: true
    t.float    "salary",     limit: 24
    t.integer  "charge_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["charge_id"], name: "fk_user_charge1_idx", using: :btree
    t.index ["person_id"], name: "fk_user_person1_idx", using: :btree
  end

  create_table "user_test", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", limit: 256, null: false
    t.string "password", limit: 256, null: false
  end

  add_foreign_key "charge_has_components", "charge", name: "fk_components_has_charge_charge1"
  add_foreign_key "charge_has_components", "components", column: "components_id", name: "fk_components_has_charge_components1"
  add_foreign_key "charge_has_components", "privileges", column: "privileges_id", name: "fk_components_has_charge_privileges1"
  add_foreign_key "components", "modules", column: "modules_id", name: "fk_components_modules1"
  add_foreign_key "user", "charge", name: "fk_user_charge1"
  add_foreign_key "user", "person", name: "fk_user_person1"
end
