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

ActiveRecord::Schema.define(version: 20170406145347) do

  create_table "disciplinas", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grande_temas", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "disciplina_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["disciplina_id"], name: "index_grande_temas_on_disciplina_id"
  end

  create_table "habilidades", force: :cascade do |t|
    t.text     "descricao"
    t.integer  "objetoConhecimento_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["objetoConhecimento_id"], name: "index_habilidades_on_objetoConhecimento_id"
  end

  create_table "objeto_conhecimentos", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "grandeTema_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["grandeTema_id"], name: "index_objeto_conhecimentos_on_grandeTema_id"
  end

  create_table "questaos", force: :cascade do |t|
    t.text     "enunciado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resposta", force: :cascade do |t|
    t.text     "texto"
    t.boolean  "correta"
    t.integer  "questao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questao_id"], name: "index_resposta_on_questao_id"
  end

end
