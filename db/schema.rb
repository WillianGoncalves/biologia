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

ActiveRecord::Schema.define(version: 20170408231927) do

  create_table "abilities", force: :cascade do |t|
    t.text     "description"
    t.integer  "knowledge_object_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["knowledge_object_id"], name: "index_abilities_on_knowledge_object_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text     "text"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "great_themes", force: :cascade do |t|
    t.string   "description"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["discipline_id"], name: "index_great_themes_on_discipline_id"
  end

  create_table "knowledge_objects", force: :cascade do |t|
    t.string   "description"
    t.integer  "great_theme_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["great_theme_id"], name: "index_knowledge_objects_on_great_theme_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "statement"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_type", default: 0
    t.integer  "ability_id"
    t.index ["ability_id"], name: "index_questions_on_ability_id"
  end

end
