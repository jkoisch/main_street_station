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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120926155154) do

  create_table "communities", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "objective"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "community_role_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "community_roles", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "community_id"
    t.string   "role_kind"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "registration_contracts", :force => true do |t|
    t.integer  "community_id"
    t.string   "status"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "constraint"
    t.integer  "registration_whitelabel_id"
  end

  create_table "registration_parties", :force => true do |t|
    t.integer  "community_role_id"
    t.text     "signature"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "address"
    t.integer  "contract_id"
    t.string   "invitation_status"
    t.boolean  "owner"
  end

  create_table "registration_whitelabel_groups", :force => true do |t|
    t.integer  "whitelabel_id"
    t.integer  "community_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "directory_community_id"
  end

  create_table "registration_whitelabels", :force => true do |t|
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
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "services", :force => true do |t|
    t.integer  "community_role_id"
    t.text     "name"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "verbs", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "youcentric_objects", :force => true do |t|
    t.integer  "service_id"
    t.text     "name"
    t.text     "description"
    t.text     "script"
    t.text     "state_url"
    t.integer  "youcentric_object_parent_id"
    t.text     "design_notes"
    t.text     "conformance_profile"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "youcentric_operations", :force => true do |t|
    t.integer  "service_id"
    t.text     "name"
    t.text     "description"
    t.integer  "verb_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
