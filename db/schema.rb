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

ActiveRecord::Schema.define(version: 20150821172158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "committee_id"
    t.integer "issue_id"
    t.text    "content"
    t.text    "summary"
    t.string  "detail"
    t.string  "decision"
    t.string  "url"
    t.date    "date"
    t.string  "category"
  end

  create_table "candidate_standpoints", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.float    "agree"
    t.float    "disagree"
    t.float    "abstain"
    t.float    "notvote"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "party_id"
    t.string   "gender"
    t.integer  "age"
    t.text     "education"
    t.text     "experience"
    t.text     "manifesto"
    t.text     "aimed_bill"
    t.text     "aimed_issue"
    t.integer  "legislator_no"
    t.boolean  "withdraw",              default: false
    t.boolean  "eight",                 default: false
    t.integer  "eight_constituency_id"
    t.boolean  "nine",                  default: false
    t.integer  "nine_constituency_id"
    t.integer  "nine_position"
    t.integer  "nine_number"
    t.integer  "target"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "candidates_committees", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "committee_id"
  end

  add_index "candidates_committees", ["candidate_id", "committee_id"], name: "index_candidates_committees_on_candidate_id_and_committee_id", unique: true, using: :btree

  create_table "candidates_dms", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "dm_id"
  end

  add_index "candidates_dms", ["candidate_id", "dm_id"], name: "index_candidates_dms_on_candidate_id_and_dm_id", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "clarifies", force: :cascade do |t|
    t.integer  "record_id"
    t.string   "record_type"
    t.text     "content"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clarifies", ["record_id", "record_type"], name: "index_clarifies_on_record_id_and_record_type", unique: true, using: :btree

  create_table "committees", force: :cascade do |t|
    t.string "name"
    t.string "kind"
  end

  create_table "constituencies", force: :cascade do |t|
    t.string  "name"
    t.integer "county_id"
    t.string  "kind"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
  end

  create_table "districts", force: :cascade do |t|
    t.string  "name"
    t.integer "constituency_id"
  end

  create_table "dms", force: :cascade do |t|
    t.string   "name"
    t.integer  "issue_id"
    t.string   "file"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dms_parties", id: false, force: :cascade do |t|
    t.integer "dm_id"
    t.integer "party_id"
  end

  add_index "dms_parties", ["dm_id", "party_id"], name: "index_dms_parties_on_dm_id_and_party_id", unique: true, using: :btree

  create_table "interpellations", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "committee_id"
    t.integer "issue_id"
    t.text    "content"
    t.text    "summary"
    t.string  "detail"
    t.string  "decision"
    t.string  "url"
    t.date    "date"
    t.string  "category"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "image"
    t.text     "description"
    t.string   "alt"
    t.date     "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.string   "ngo"
    t.string   "ngo_link"
    t.boolean  "published",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "abbreviation"
    t.string   "image"
    t.string   "background"
    t.integer  "prediction",   default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "party_standpoints", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "issue_id"
    t.float    "agree"
    t.float    "disagree"
    t.float    "abstain"
    t.float    "notvote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promises", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "question_id"
    t.text     "answer"
    t.text     "summary"
    t.string   "detail"
    t.string   "decision"
    t.date     "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.integer  "issue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "slides", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "image"
    t.string   "alt"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "provider_uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "committee_id"
    t.integer "issue_id"
    t.text    "content"
    t.text    "summary"
    t.string  "detail"
    t.string  "decision"
    t.string  "url"
    t.date    "date"
    t.string  "category"
  end

end
