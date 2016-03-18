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

ActiveRecord::Schema.define(version: 20160318110153) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "analise_privacidades", force: :cascade do |t|
    t.string   "rede_social",       limit: 255
    t.string   "url_rede_social",   limit: 255
    t.text     "descricao_analise", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "categoria_dimensoes", force: :cascade do |t|
    t.string   "categoria",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "controle_privacidades", force: :cascade do |t|
    t.string   "controle",           limit: 255
    t.text     "descricao_controle", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "dimensoes", force: :cascade do |t|
    t.integer  "categoria_dimensoes_id",        limit: 4
    t.string   "nome_dimensao",                 limit: 255,   null: false
    t.string   "codigo_dimensao",               limit: 255
    t.text     "descricao_dimensao",            limit: 65535
    t.text     "significado_nivel_privacidade", limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "dimensoes", ["categoria_dimensoes_id"], name: "index_dimensoes_on_categoria_dimensoes_id", using: :btree

  create_table "historico_analises", force: :cascade do |t|
    t.integer  "users_id",                limit: 4
    t.integer  "analise_privacidades_id", limit: 4
    t.datetime "data_analise"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "historico_analises", ["analise_privacidades_id"], name: "index_historico_analises_on_analise_privacidades_id", using: :btree
  add_index "historico_analises", ["users_id"], name: "index_historico_analises_on_users_id", using: :btree

  create_table "modelagem_privacidades", force: :cascade do |t|
    t.integer  "dimensoes_id",             limit: 4
    t.integer  "controle_privacidades_id", limit: 4
    t.integer  "tipo_comunicacoes_id",     limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "modelagem_privacidades", ["controle_privacidades_id"], name: "index_modelagem_privacidades_on_controle_privacidades_id", using: :btree
  add_index "modelagem_privacidades", ["dimensoes_id"], name: "index_modelagem_privacidades_on_dimensoes_id", using: :btree
  add_index "modelagem_privacidades", ["tipo_comunicacoes_id"], name: "index_modelagem_privacidades_on_tipo_comunicacoes_id", using: :btree

  create_table "nivel_privacidades", force: :cascade do |t|
    t.string   "nivel_privacidade", limit: 255, null: false
    t.integer  "nivel",             limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "recomendacao_valores", force: :cascade do |t|
    t.integer  "modelagem_privacidades_id", limit: 4
    t.integer  "valor_dimensoes_id",        limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "recomendacao_valores", ["modelagem_privacidades_id"], name: "index_recomendacao_valores_on_modelagem_privacidades_id", using: :btree
  add_index "recomendacao_valores", ["valor_dimensoes_id"], name: "index_recomendacao_valores_on_valor_dimensoes_id", using: :btree

  create_table "tipo_comunicacoes", force: :cascade do |t|
    t.integer  "analise_privacidade_id", limit: 4
    t.string   "tipo_comunicacao",       limit: 255
    t.text     "observacao",             limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tipo_comunicacoes", ["analise_privacidade_id"], name: "index_tipo_comunicacoes_on_analise_privacidade_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "valor_dimensoes", force: :cascade do |t|
    t.integer  "dimensoes_id",          limit: 4
    t.integer  "nivel_privacidades_id", limit: 4
    t.string   "valor",                 limit: 255,   null: false
    t.text     "descricao_valor",       limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "valor_dimensoes", ["dimensoes_id"], name: "index_valor_dimensoes_on_dimensoes_id", using: :btree
  add_index "valor_dimensoes", ["nivel_privacidades_id"], name: "index_valor_dimensoes_on_nivel_privacidades_id", using: :btree

end
