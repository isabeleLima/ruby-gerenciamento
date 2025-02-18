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

ActiveRecord::Schema[8.0].define(version: 2025_02_18_204625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "funcionarios_setors", force: :cascade do |t|
    t.bigint "setor_id", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setor_id"], name: "index_funcionarios_setors_on_setor_id"
    t.index ["usuario_id"], name: "index_funcionarios_setors_on_usuario_id"
  end

  create_table "setors", force: :cascade do |t|
    t.bigint "unidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["unidade_id"], name: "index_setors_on_unidade_id"
  end

  create_table "unidades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id"
    t.index ["usuario_id"], name: "index_unidades_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "visita", force: :cascade do |t|
    t.bigint "visitante_id", null: false
    t.datetime "date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id"
    t.bigint "setor_id"
    t.index ["setor_id"], name: "index_visita_on_setor_id"
    t.index ["usuario_id"], name: "index_visita_on_usuario_id"
    t.index ["visitante_id"], name: "index_visita_on_visitante_id"
  end

  create_table "visitantes", force: :cascade do |t|
    t.string "cpf"
    t.string "name"
    t.string "telephone"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "funcionarios_setors", "setors"
  add_foreign_key "funcionarios_setors", "usuarios"
  add_foreign_key "setors", "unidades"
  add_foreign_key "unidades", "usuarios"
  add_foreign_key "visita", "setors"
  add_foreign_key "visita", "usuarios"
  add_foreign_key "visita", "visitantes"
end
