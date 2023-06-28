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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_200936) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "street", null: false
    t.string "neighborhood", null: false
    t.string "number", null: false
    t.string "address_detail"
    t.string "zipcode", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "carts", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.text "subject"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_claims_on_user_id"
  end

  create_table "line_items", charset: "utf8", force: :cascade do |t|
    t.integer "quantity"
    t.integer "status"
    t.decimal "payed_price", precision: 10, scale: 2
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_items", charset: "utf8", force: :cascade do |t|
    t.float "unit_price"
    t.integer "quantity"
    t.float "total_price"
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "cpf"
    t.string "phone"
    t.string "cellphone"
    t.string "street"
    t.string "district"
    t.string "number"
    t.string "complement"
    t.string "brazil_country"
    t.string "city"
    t.string "state"
    t.string "zip_number"
    t.integer "status"
    t.float "subtotal"
    t.float "total"
    t.boolean "debit_card"
    t.boolean "credit_card"
    t.boolean "billet"
    t.boolean "pix"
    t.string "credit_card_number"
    t.string "credit_card_name"
    t.string "credit_card_expired_date"
    t.string "credit_card_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "wish_item_id"
    t.index ["wish_item_id"], name: "index_orders_on_wish_item_id"
  end

  create_table "products", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.boolean "publish", default: false, null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "promo", default: false
    t.decimal "promo_price", precision: 10, default: "0"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.string "cnpj"
    t.string "cpf"
    t.string "date_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_items", charset: "utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wish_items_on_product_id"
    t.index ["user_id"], name: "index_wish_items_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "claims", "users"
  add_foreign_key "line_items", "products"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "wish_items"
  add_foreign_key "products", "categories"
  add_foreign_key "wish_items", "products"
  add_foreign_key "wish_items", "users"
end
