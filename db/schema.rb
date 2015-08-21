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

ActiveRecord::Schema.define(version: 20150821085027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_eight_data", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "constituency_id"
  end

  add_index "ad_eight_data", ["candidate_id"], name: "index_ad_eight_data_on_candidate_id", using: :btree
  add_index "ad_eight_data", ["constituency_id"], name: "index_ad_eight_data_on_constituency_id", using: :btree

  create_table "ad_nine_data", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "constituency_id"
    t.integer "order"
    t.integer "number"
  end

  add_index "ad_nine_data", ["candidate_id"], name: "index_ad_nine_data_on_candidate_id", using: :btree
  add_index "ad_nine_data", ["constituency_id"], name: "index_ad_nine_data_on_constituency_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.integer  "record_id"
    t.string   "record_type"
    t.text     "content"
    t.text     "summary"
    t.string   "detail"
    t.string   "decision"
    t.string   "url"
    t.datetime "date"
  end

  add_index "bills", ["candidate_id"], name: "index_bills_on_candidate_id", using: :btree
  add_index "bills", ["issue_id"], name: "index_bills_on_issue_id", using: :btree
  add_index "bills", ["record_type", "record_id"], name: "index_bills_on_record_type_and_record_id", using: :btree

  create_table "candidate_standpoints", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "issue_id"
    t.float   "agree"
    t.float   "disagree"
    t.float   "abstain"
    t.float   "notvote"
  end

  add_index "candidate_standpoints", ["candidate_id"], name: "index_candidate_standpoints_on_candidate_id", using: :btree
  add_index "candidate_standpoints", ["issue_id"], name: "index_candidate_standpoints_on_issue_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string  "name"
    t.string  "image"
    t.integer "party_id"
    t.string  "gender"
    t.integer "age"
    t.text    "education"
    t.text    "experience"
    t.text    "manifesto"
    t.text    "aimed_bill"
    t.text    "aimed_issue"
    t.integer "legislator_no"
    t.integer "target_id"
    t.string  "target_type"
  end

  add_index "candidates", ["party_id"], name: "index_candidates_on_party_id", using: :btree
  add_index "candidates", ["target_type", "target_id"], name: "index_candidates_on_target_type_and_target_id", using: :btree

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

  create_table "clarifies", force: :cascade do |t|
    t.integer  "record_id"
    t.string   "record_type"
    t.text     "content"
    t.datetime "date"
  end

  add_index "clarifies", ["record_id"], name: "index_clarifies_on_record_id", using: :btree

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

  add_index "districts", ["constituency_id"], name: "index_districts_on_constituency_id", using: :btree

  create_table "dms", force: :cascade do |t|
    t.string  "name"
    t.integer "issue_id"
    t.string  "file"
    t.string  "image"
  end

  create_table "dms_parties", id: false, force: :cascade do |t|
    t.integer "dm_id"
    t.integer "party_id"
  end

  add_index "dms_parties", ["dm_id", "party_id"], name: "index_dms_parties_on_dm_id_and_party_id", unique: true, using: :btree

  create_table "interpellations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.integer  "record_id"
    t.string   "record_type"
    t.text     "content"
    t.text     "summary"
    t.string   "detail"
    t.string   "decision"
    t.string   "url"
    t.datetime "date"
  end

  add_index "interpellations", ["candidate_id"], name: "index_interpellations_on_candidate_id", using: :btree
  add_index "interpellations", ["issue_id"], name: "index_interpellations_on_issue_id", using: :btree
  add_index "interpellations", ["record_type", "record_id"], name: "index_interpellations_on_record_type_and_record_id", using: :btree

  create_table "interviews", force: :cascade do |t|
    t.integer "candidate_id"
    t.string  "image"
    t.text    "description"
    t.string  "alt"
  end

  add_index "interviews", ["candidate_id"], name: "index_interviews_on_candidate_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string  "name"
    t.string  "image"
    t.text    "description"
    t.string  "ngo"
    t.string  "ngo_link"
    t.boolean "published",   default: false
  end

  create_table "parties", force: :cascade do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.string  "image"
    t.integer "prediction"
    t.integer "target_id"
    t.string  "target_type"
  end

  add_index "parties", ["target_type", "target_id"], name: "index_parties_on_target_type_and_target_id", using: :btree

  create_table "party_standpoints", force: :cascade do |t|
    t.integer "party_id"
    t.integer "issue_id"
    t.float   "agree"
    t.float   "disagree"
    t.float   "abstain"
    t.float   "notvote"
  end

  add_index "party_standpoints", ["issue_id"], name: "index_party_standpoints_on_issue_id", using: :btree
  add_index "party_standpoints", ["party_id"], name: "index_party_standpoints_on_party_id", using: :btree

  create_table "promises", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "question_id"
    t.text     "answer"
    t.text     "summary"
    t.string   "detail"
    t.string   "decision"
    t.datetime "date"
  end

  add_index "promises", ["candidate_id"], name: "index_promises_on_candidate_id", using: :btree
  add_index "promises", ["question_id"], name: "index_promises_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text    "question"
    t.integer "issue_id"
  end

  add_index "questions", ["issue_id"], name: "index_questions_on_issue_id", using: :btree

  create_table "slides", force: :cascade do |t|
    t.integer "issue_id"
    t.string  "image"
    t.string  "alt"
    t.integer "order"
  end

  add_index "slides", ["issue_id"], name: "index_slides_on_issue_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.integer  "record_id"
    t.string   "record_type"
    t.text     "content"
    t.text     "summary"
    t.string   "detail"
    t.string   "decision"
    t.string   "url"
    t.datetime "date"
  end

  add_index "votes", ["candidate_id"], name: "index_votes_on_candidate_id", using: :btree
  add_index "votes", ["issue_id"], name: "index_votes_on_issue_id", using: :btree
  add_index "votes", ["record_type", "record_id"], name: "index_votes_on_record_type_and_record_id", using: :btree

  add_foreign_key "ad_eight_data", "candidates"
  add_foreign_key "ad_eight_data", "constituencies"
  add_foreign_key "ad_nine_data", "candidates"
  add_foreign_key "ad_nine_data", "constituencies"
  add_foreign_key "bills", "candidates"
  add_foreign_key "bills", "issues"
  add_foreign_key "candidate_standpoints", "candidates"
  add_foreign_key "candidate_standpoints", "issues"
  add_foreign_key "candidates", "parties"
  add_foreign_key "districts", "constituencies"
  add_foreign_key "interpellations", "candidates"
  add_foreign_key "interpellations", "issues"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "party_standpoints", "issues"
  add_foreign_key "party_standpoints", "parties"
  add_foreign_key "promises", "candidates"
  add_foreign_key "promises", "questions"
  add_foreign_key "questions", "issues"
  add_foreign_key "slides", "issues"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "issues"
end
