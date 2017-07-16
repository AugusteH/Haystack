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

ActiveRecord::Schema.define(version: 20170716172407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.integer  "client_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "retailer"
    t.boolean  "manufacturer"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "companyName"
    t.string   "companyDetails"
    t.json     "locations"
    t.text     "description"
    t.json     "phone_numbers"
    t.json     "emails"
    t.text     "limitations"
    t.text     "channels"
    t.text     "pricing"
    t.integer  "user_id",        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "reference"
    t.integer  "address_id"
    t.integer  "client_id"
    t.integer  "total_payment_cents"
    t.string   "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "category"
    t.integer  "price_cents"
    t.integer  "quantity"
    t.boolean  "active",                                              default: false
    t.string   "subcategory"
    t.text     "distribution"
    t.text     "unique_selling_propositions"
    t.text     "distribution_limitations"
    t.text     "distribution_channels"
    t.boolean  "drop_ship_capability"
    t.json     "approvals_certifications"
    t.string   "private_label_capability"
    t.text     "target_audience"
    t.string   "company_name"
    t.string   "image"
    t.string   "sku"
    t.string   "barcode"
    t.string   "width"
    t.string   "height"
    t.string   "depth"
    t.string   "weight"
    t.string   "extra_shipping_fee"
    t.decimal  "price_tax_excluded",          precision: 5, scale: 2
    t.decimal  "price_tax_included",          precision: 5, scale: 2
    t.decimal  "tax_rate",                    precision: 5, scale: 2
    t.integer  "compared_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
