# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150807000005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_permissions", force: :cascade do |t|
    t.string   "access_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caregivers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_resource", force: :cascade do |t|
    t.string "resource"
    t.string "access"
  end

  create_table "circles", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "objective"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "community_role_kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "community_roles", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "community_id"
    t.string   "role_kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identity_authorities", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "type"
    t.string   "provider",               null: false
    t.string   "uid",                    null: false
    t.string   "token_secret"
    t.string   "password_digest"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identity_authorities", ["confirmation_token"], name: "index_identity_authorities_on_confirmation_token", using: :btree
  add_index "identity_authorities", ["reset_password_token"], name: "index_identity_authorities_on_reset_password_token", using: :btree
  add_index "identity_authorities", ["user_id"], name: "index_identity_authorities_on_user_id", using: :btree

  create_table "information_categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_contracts", force: :cascade do |t|
    t.integer  "communities_id"
    t.string   "status"
    t.string   "constraints"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_whitelabel_id"
  end

  create_table "registration_parties", force: :cascade do |t|
    t.integer  "community_role_id"
    t.text     "signature"
    t.string   "address"
    t.string   "invitation_status"
    t.integer  "user_id"
    t.boolean  "owner"
    t.integer  "registration_contracts_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_whitelabel_groups", force: :cascade do |t|
    t.integer  "whitelabel_id"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "directory_community_id"
  end

  create_table "registration_whitelabels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "contact_id"
    t.string   "contact_phone"
    t.text     "address1"
    t.text     "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_postal_code"
    t.string   "work_phone"
    t.string   "email_primary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: :cascade do |t|
    t.integer  "community_role_id"
    t.text     "name"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tokens", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.string   "authentication_token",  null: false
    t.string   "refresh_token",         null: false
    t.datetime "authentication_expiry", null: false
    t.datetime "refresh_expiry",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tokens", ["authentication_token"], name: "index_user_tokens_on_authentication_token", unique: true, using: :btree
  add_index "user_tokens", ["refresh_token"], name: "index_user_tokens_on_refresh_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "verbs", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youcentric_objects", force: :cascade do |t|
    t.integer  "service_id"
    t.text     "name"
    t.text     "description"
    t.text     "script"
    t.text     "state_url"
    t.integer  "youcentric_object_parent_id"
    t.text     "design_notes"
    t.text     "conformance_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youcentric_operations", force: :cascade do |t|
    t.integer  "service_id"
    t.text     "name"
    t.text     "description"
    t.integer  "verb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
