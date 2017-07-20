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

  create_table "atp_fraction", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "fraction"
    t.integer  "packaging_id",                                      null: false, unsigned: true
    t.datetime "created_at",   default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",   default: -> { "CURRENT_TIMESTAMP" }
    t.index ["packaging_id"], name: "fk_atp_fraction_packaging1_idx", using: :btree
  end

  create_table "atp_impost", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "impost"
    t.integer  "products_id",                                      null: false, unsigned: true
    t.datetime "created_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.index ["products_id"], name: "fk_atp_impost_products1_idx", using: :btree
  end

  create_table "atp_stock", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "min_stock"
    t.integer  "max_stock"
    t.integer  "products_id",                                      null: false, unsigned: true
    t.datetime "created_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["products_id"], name: "fk_atp_stock_products1_idx", using: :btree
  end

  create_table "atp_unity", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "unity",      limit: 15,                                      null: false
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "birthday", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id",                                      null: false, unsigned: true
    t.integer  "calendar_id",                                      null: false, unsigned: true
    t.datetime "created_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.index ["calendar_id"], name: "fk_calendar_has_customer_calendar1_idx", using: :btree
    t.index ["customer_id"], name: "fk_calendar_has_customer_customer1_idx", using: :btree
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
  end

  create_table "calendar", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "promotion_date"
    t.datetime "created_at",     default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",     default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "calendar_notify", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "notify_content_id",                                      null: false
    t.integer  "calendar_id",                                            null: false, unsigned: true
    t.datetime "created_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.index ["calendar_id"], name: "fk_calendar_has_notify_content_calendar1_idx", using: :btree
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["notify_content_id"], name: "fk_calendar_has_notify_content_notify_content1_idx", using: :btree
  end

  create_table "category", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 20
    t.string   "description", limit: 150
    t.string   "aasm_state",  limit: 45,                                       null: false
    t.datetime "created_at",              default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",              default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "chance", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 45
    t.integer  "products_id",                                                 null: false, unsigned: true
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.index ["products_id"], name: "fk_chance_products1_idx", using: :btree
  end

  create_table "charge", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "charge",     limit: 25
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "charge_has_components", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "charge_id",                                          null: false, unsigned: true
    t.integer  "components_id",                                      null: false, unsigned: true
    t.integer  "privileges_id",                                      null: false, unsigned: true
    t.datetime "created_at",    default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",    default: -> { "CURRENT_TIMESTAMP" }
    t.index ["charge_id"], name: "fk_components_has_charge_charge1_idx", using: :btree
    t.index ["components_id"], name: "fk_components_has_charge_components1_idx", using: :btree
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["privileges_id"], name: "fk_components_has_charge_privileges1_idx", using: :btree
  end

  create_table "components", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "components", limit: 25
    t.integer  "modules_id",                                                 null: false, unsigned: true
    t.string   "icon",       limit: 20
    t.string   "path",       limit: 30
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.index ["modules_id"], name: "fk_components_modules1_idx", using: :btree
  end

  create_table "contact", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "provider_id",                                      null: false, unsigned: true
    t.integer  "person_id",                                        null: false, unsigned: true
    t.datetime "created_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",  default: -> { "CURRENT_TIMESTAMP" }
    t.index ["person_id"], name: "fk_contact_person1_idx", using: :btree
    t.index ["provider_id"], name: "fk_contact_provider1_idx", using: :btree
  end

  create_table "customer", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "person_id",                                       null: false, unsigned: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["person_id"], name: "fk_client_person1_idx", using: :btree
  end

  create_table "modules", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "modules",    limit: 15
    t.string   "icon",       limit: 20
    t.string   "path",       limit: 50
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "notify_content", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "coment",     limit: 45
    t.integer  "flag",       limit: 1
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "notify_due_date", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "notify_content_id",                                         null: false
    t.integer  "purchase_purchase_id",                                      null: false, unsigned: true
    t.datetime "created_at",           default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",           default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["notify_content_id"], name: "fk_notify_content_has_purchase_notify_content1_idx", using: :btree
    t.index ["purchase_purchase_id"], name: "fk_notify_content_has_purchase_purchase1_idx", using: :btree
  end

  create_table "notify_proof_purchase", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "notify_content_id",                                      null: false
    t.integer  "proof_purchase_id",                                      null: false, unsigned: true
    t.datetime "created_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["notify_content_id"], name: "fk_notify_content_has_proof_purchase_notify_content1_idx", using: :btree
    t.index ["proof_purchase_id"], name: "fk_notify_content_has_proof_purchase_proof_purchase1_idx", using: :btree
  end

  create_table "notify_receipt", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "notify_content_id",                                      null: false
    t.integer  "recipe_id",                                              null: false, unsigned: true
    t.datetime "created_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",        default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["notify_content_id"], name: "fk_notify_content_has_receipt_notify_content1_idx", using: :btree
    t.index ["recipe_id"], name: "fk_notify_content_has_receipt_receipt1_idx", using: :btree
  end

  create_table "packaging", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "id_supra",                                        null: false, unsigned: true
    t.integer  "id_sub",                                          null: false, unsigned: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["id_sub"], name: "fk_productos_has_productos_productos2_idx", using: :btree
    t.index ["id_supra"], name: "fk_productos_has_productos_productos1_idx", using: :btree
  end

  create_table "person", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 30
    t.string   "last_name",  limit: 15
    t.string   "slast_name", limit: 15
    t.string   "cellphone",  limit: 9
    t.string   "email",      limit: 35
    t.date     "birthday"
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "phone", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "phone",       limit: 12
    t.integer  "provider_id",                                                 null: false, unsigned: true
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.index ["provider_id"], name: "fk_phone_provider1_idx", using: :btree
  end

  create_table "planning", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "products_id",                                                  null: false, unsigned: true
    t.integer  "provider_id",                                                  null: false, unsigned: true
    t.integer  "flag",          limit: 1
    t.integer  "quantity"
    t.date     "planning_date"
    t.date     "final_date"
    t.datetime "created_at",              default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",              default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["products_id"], name: "fk_products_has_provider_products1_idx", using: :btree
    t.index ["provider_id"], name: "fk_products_has_provider_provider1_idx", using: :btree
  end

  create_table "privileges", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "privileges", limit: 25
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "products", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            limit: 50,                                       null: false
    t.string   "description",     limit: 150
    t.string   "url_image",       limit: 200
    t.string   "bar_code",        limit: 25
    t.integer  "flag",            limit: 1,   default: 1
    t.float    "suggested_price", limit: 24
    t.integer  "unity_id",                                                         null: false, unsigned: true
    t.integer  "category_id",                                                      null: false, unsigned: true
    t.datetime "created_at",                  default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",                  default: -> { "CURRENT_TIMESTAMP" }
    t.index ["category_id"], name: "fk_products_category1_idx", using: :btree
    t.index ["unity_id"], name: "fk_productos_tap_unidad1_idx", using: :btree
  end

  create_table "promotion", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",        limit: 15
    t.string   "description", limit: 45
    t.integer  "discount"
    t.integer  "calendar_id",                                                 null: false, unsigned: true
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.index ["calendar_id"], name: "fk_promotion_calendar1_idx", using: :btree
  end

  create_table "promotion_has_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "promotion_id",                                      null: false, unsigned: true
    t.integer  "products_id",                                       null: false, unsigned: true
    t.datetime "created_at",   default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",   default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["products_id"], name: "fk_promotion_has_products_products1_idx", using: :btree
    t.index ["promotion_id"], name: "fk_promotion_has_products_promotion1_idx", using: :btree
  end

  create_table "proof_sale", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sale_id",                                                      null: false, unsigned: true
    t.integer  "products_id",                                                  null: false, unsigned: true
    t.string   "quantity",    limit: 45
    t.float    "total_price", limit: 24
    t.integer  "user_id",                                                      null: false, unsigned: true
    t.string   "commentary",  limit: 200
    t.datetime "created_at",              default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",              default: -> { "CURRENT_TIMESTAMP" }
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["products_id"], name: "fk_customer_has_voucher_has_products_products1_idx", using: :btree
    t.index ["sale_id"], name: "fk_customer_has_voucher_has_products_customer_has_voucher1_idx", using: :btree
    t.index ["user_id"], name: "fk_proof_purchase_user1_idx", using: :btree
  end

  create_table "provider", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 50
    t.string   "ruc",        limit: 12
    t.string   "address",    limit: 150
    t.string   "email",      limit: 100
    t.string   "url_page",   limit: 120
    t.string   "url_image",  limit: 150
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",             default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "purchase", primary_key: "int", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "receipt_id",                                                          null: false, unsigned: true
    t.integer  "product_id",                                                          null: false, unsigned: true
    t.integer  "quantity"
    t.float    "purchase_price",      limit: 24
    t.date     "due_date"
    t.float    "total_price_product", limit: 24
    t.datetime "created_at",                     default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",                     default: -> { "CURRENT_TIMESTAMP" }
    t.index ["int"], name: "purchasecol_UNIQUE", unique: true, using: :btree
    t.index ["product_id"], name: "fk_products_has_voucher_has_provider_products1_idx", using: :btree
    t.index ["receipt_id"], name: "fk_receipt_provider_purchase1_idx", using: :btree
  end

  create_table "receipt", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "purchase_date"
    t.string   "purchase_number",      limit: 15
    t.float    "purchase_total_price", limit: 24
    t.string   "url_image",            limit: 150
    t.integer  "voucher_id",                                                            null: false
    t.integer  "provider_id",                                                           null: false, unsigned: true
    t.integer  "user_id",                                                               null: false, unsigned: true
    t.string   "commentary",           limit: 200
    t.datetime "created_at",                       default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",                       default: -> { "CURRENT_TIMESTAMP" }
    t.index ["provider_id"], name: "fk_purchase_provider1_idx", using: :btree
    t.index ["user_id"], name: "fk_receipt_user1_idx", using: :btree
    t.index ["voucher_id"], name: "fk_purchase_voucher1_idx", using: :btree
  end

  create_table "sale", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "voucher_id",                                                           null: false
    t.integer  "customer_id",                                                          null: false, unsigned: true
    t.float    "total_price_purchase", limit: 24,                                      null: false
    t.datetime "created_at",                      default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",                      default: -> { "CURRENT_TIMESTAMP" }
    t.index ["customer_id"], name: "fk_customer_has_voucher_customer1_idx", using: :btree
    t.index ["id"], name: "id_UNIQUE", unique: true, using: :btree
    t.index ["voucher_id"], name: "fk_customer_has_voucher_voucher1_idx", using: :btree
  end

  create_table "user", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",   limit: 45
    t.string   "password",   limit: 45
    t.integer  "person_id",                                                  null: false, unsigned: true
    t.float    "salary",     limit: 24
    t.integer  "charge_id",                                                  null: false, unsigned: true
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.index ["charge_id"], name: "fk_user_charge1_idx", using: :btree
    t.index ["person_id"], name: "fk_user_person1_idx", using: :btree
  end

  create_table "voucher", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "typev",      limit: 15
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",            default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "warehouse", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "sale_price",  limit: 24
    t.integer  "stock"
    t.integer  "products_id",                                                 null: false, unsigned: true
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at",             default: -> { "CURRENT_TIMESTAMP" }
    t.index ["products_id"], name: "fk_warehouse_products1_idx", using: :btree
  end

  add_foreign_key "atp_fraction", "packaging", primary_key: "id_supra", name: "fk_atp_fraction_packaging1"
  add_foreign_key "atp_impost", "products", column: "products_id", name: "fk_atp_impost_products1"
  add_foreign_key "atp_stock", "products", column: "products_id", name: "fk_atp_stock_products1"
  add_foreign_key "birthday", "calendar", name: "fk_calendar_has_customer_calendar1"
  add_foreign_key "birthday", "customer", name: "fk_calendar_has_customer_customer1"
  add_foreign_key "calendar_notify", "calendar", name: "fk_calendar_has_notify_content_calendar1"
  add_foreign_key "calendar_notify", "notify_content", name: "fk_calendar_has_notify_content_notify_content1"
  add_foreign_key "chance", "products", column: "products_id", name: "fk_chance_products1"
  add_foreign_key "charge_has_components", "charge", name: "fk_components_has_charge_charge1"
  add_foreign_key "charge_has_components", "components", column: "components_id", name: "fk_components_has_charge_components1"
  add_foreign_key "charge_has_components", "privileges", column: "privileges_id", name: "fk_components_has_charge_privileges1"
  add_foreign_key "components", "modules", column: "modules_id", name: "fk_components_modules1"
  add_foreign_key "contact", "person", name: "fk_contact_person1"
  add_foreign_key "contact", "provider", name: "fk_contact_provider1"
  add_foreign_key "customer", "person", name: "fk_client_person1"
  add_foreign_key "notify_due_date", "notify_content", name: "fk_notify_content_has_purchase_notify_content1"
  add_foreign_key "notify_due_date", "purchase", column: "purchase_purchase_id", primary_key: "receipt_id", name: "fk_notify_content_has_purchase_purchase1"
  add_foreign_key "notify_proof_purchase", "notify_content", name: "fk_notify_content_has_proof_purchase_notify_content1"
  add_foreign_key "notify_proof_purchase", "proof_sale", column: "proof_purchase_id", primary_key: "sale_id", name: "fk_notify_content_has_proof_purchase_proof_purchase1"
  add_foreign_key "notify_receipt", "notify_content", name: "fk_notify_content_has_receipt_notify_content1"
  add_foreign_key "notify_receipt", "receipt", column: "recipe_id", name: "fk_notify_content_has_receipt_receipt1"
  add_foreign_key "packaging", "products", column: "id_sub", name: "fk_productos_has_productos_productos2"
  add_foreign_key "packaging", "products", column: "id_supra", name: "fk_productos_has_productos_productos1"
  add_foreign_key "phone", "provider", name: "fk_phone_provider1"
  add_foreign_key "planning", "products", column: "products_id", name: "fk_products_has_provider_products1"
  add_foreign_key "planning", "provider", name: "fk_products_has_provider_provider1"
  add_foreign_key "products", "atp_unity", column: "unity_id", name: "fk_productos_tap_unidad1"
  add_foreign_key "products", "category", name: "fk_products_category1"
  add_foreign_key "promotion", "calendar", name: "fk_promotion_calendar1"
  add_foreign_key "promotion_has_products", "products", column: "products_id", name: "fk_promotion_has_products_products1"
  add_foreign_key "promotion_has_products", "promotion", name: "fk_promotion_has_products_promotion1"
  add_foreign_key "proof_sale", "products", column: "products_id", name: "fk_customer_has_voucher_has_products_products1"
  add_foreign_key "proof_sale", "sale", name: "fk_customer_has_voucher_has_products_customer_has_voucher1"
  add_foreign_key "proof_sale", "user", name: "fk_proof_purchase_user1"
  add_foreign_key "purchase", "products", name: "fk_products_has_voucher_has_provider_products1"
  add_foreign_key "purchase", "receipt", name: "fk_receipt_provider_purchase1"
  add_foreign_key "receipt", "provider", name: "fk_purchase_provider1"
  add_foreign_key "receipt", "user", name: "fk_receipt_user1"
  add_foreign_key "receipt", "voucher", name: "fk_purchase_voucher1"
  add_foreign_key "sale", "customer", name: "fk_customer_has_voucher_customer1"
  add_foreign_key "sale", "voucher", name: "fk_customer_has_voucher_voucher1"
  add_foreign_key "user", "charge", name: "fk_user_charge1"
  add_foreign_key "user", "person", name: "fk_user_person1"
  add_foreign_key "warehouse", "products", column: "products_id", name: "fk_warehouse_products1"
end
