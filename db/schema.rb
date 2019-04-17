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

ActiveRecord::Schema.define(version: 2015_08_07_000005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_permissions", id: :serial, force: :cascade do |t|
    t.string "access_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caregivers", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_resource", id: :serial, force: :cascade do |t|
    t.string "resource"
    t.string "access"
  end

  create_table "circles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_role_kinds", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_roles", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "community_id"
    t.string "role_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identity_authorities", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "type"
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "token_secret"
    t.string "password_digest"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_identity_authorities_on_confirmation_token"
    t.index ["reset_password_token"], name: "index_identity_authorities_on_reset_password_token"
    t.index ["user_id"], name: "index_identity_authorities_on_user_id"
  end

  create_table "information_categories", id: :serial, force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registration_contracts", id: :serial, force: :cascade do |t|
    t.integer "communities_id"
    t.string "status"
    t.string "constraints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "registration_whitelabel_id"
    t.index ["communities_id"], name: "index_registration_contracts_on_communities_id"
  end

  create_table "registration_parties", id: :serial, force: :cascade do |t|
    t.integer "community_role_id"
    t.text "signature"
    t.string "address"
    t.string "invitation_status"
    t.integer "user_id"
    t.boolean "owner"
    t.integer "registration_contracts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_contracts_id"], name: "index_registration_parties_on_registration_contracts_id"
  end

  create_table "registration_whitelabel_groups", id: :serial, force: :cascade do |t|
    t.integer "whitelabel_id"
    t.integer "community_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "directory_community_id"
  end

  create_table "registration_whitelabels", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "contact_id"
    t.string "contact_phone"
    t.text "address1"
    t.text "address2"
    t.string "city"
    t.string "state"
    t.string "zip_postal_code"
    t.string "work_phone"
    t.string "email_primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.integer "community_role_id"
    t.text "name"
    t.text "description"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tokens", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "authentication_token", null: false
    t.string "refresh_token", null: false
    t.datetime "authentication_expiry", null: false
    t.datetime "refresh_expiry", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_token"], name: "index_user_tokens_on_authentication_token", unique: true
    t.index ["refresh_token"], name: "index_user_tokens_on_refresh_token", unique: true
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "verbs", id: :serial, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youcentric_objects", id: :serial, force: :cascade do |t|
    t.integer "service_id"
    t.text "name"
    t.text "description"
    t.text "script"
    t.text "state_url"
    t.integer "youcentric_object_parent_id"
    t.text "design_notes"
    t.text "conformance_profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youcentric_operations", id: :serial, force: :cascade do |t|
    t.integer "service_id"
    t.text "name"
    t.text "description"
    t.integer "verb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
