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

ActiveRecord::Schema[7.0].define(version: 2023_01_17_001842) do
  create_table "access_tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "practitioner_id", null: false
    t.date "date"
    t.boolean "approved"
    t.string "appointment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appointment_info"
    t.string "time"
    t.index ["practitioner_id"], name: "index_appointments_on_practitioner_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dosage_considerations", force: :cascade do |t|
    t.string "consideration"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_dosage_considerations_on_product_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.string "sender_class"
    t.string "receiver_class"
    t.index ["appointment_id"], name: "index_messages_on_appointment_id"
  end

  create_table "mpesas", force: :cascade do |t|
    t.integer "order_id"
    t.string "checkoutRequestId"
    t.string "merchantRequestId"
    t.string "amount"
    t.string "mpesaReceiptNumber"
    t.string "phoneNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_mpesas_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delivered"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "patient_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.date "dob"
    t.string "location"
    t.string "blood_group"
    t.float "height"
    t.float "weight"
    t.string "phone_number"
    t.float "bmi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "email"
    t.index ["user_id"], name: "index_patient_profiles_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "business_short_code"
    t.string "password"
    t.datetime "timestamp"
    t.string "transaction_type"
    t.integer "party_A", limit: 8
    t.integer "party_B", limit: 8
    t.integer "phone_number"
    t.string "callback_url"
    t.string "account_reference"
    t.string "transaction_desc"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "practitioner_profiles", force: :cascade do |t|
    t.integer "practitioner_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.date "dob"
    t.string "phone_number"
    t.string "location"
    t.string "blood_group"
    t.float "weight"
    t.float "bmi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "job_title"
    t.string "email"
    t.float "height"
    t.index ["practitioner_id"], name: "index_practitioner_profiles_on_practitioner_id"
  end

  create_table "practitioners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id", null: false
    t.index ["department_id"], name: "index_practitioners_on_department_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "image"
    t.string "dosage"
    t.integer "stock"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "payment_id"
    t.string "merchant_request_id"
    t.string "response_description"
    t.integer "response_code"
    t.string "customer_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_responses_on_payment_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "description_header"
    t.string "description_content"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["order_id"], name: "index_shopping_carts_on_order_id"
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
  end

  create_table "side_effects", force: :cascade do |t|
    t.string "side_effect"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_side_effects_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "practitioners"
  add_foreign_key "appointments", "users"
  add_foreign_key "dosage_considerations", "products"
  add_foreign_key "messages", "appointments"
  add_foreign_key "mpesas", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "patient_profiles", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "practitioner_profiles", "practitioners"
  add_foreign_key "practitioners", "departments"
  add_foreign_key "responses", "payments"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "shopping_carts", "orders"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "side_effects", "products"
end
