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

ActiveRecord::Schema.define(version: 20140728150527) do

  create_table "centro_saluds", force: true do |t|
    t.string   "nombre"
    t.string   "rif"
    t.text     "descripcion"
    t.string   "estado"
    t.string   "ciudad"
    t.text     "direccion"
    t.text     "direccion_fiscal"
    t.string   "telefono"
    t.string   "fax"
    t.string   "sitio_web"
    t.integer  "usuario_id",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicos", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.text     "direccion"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_oficina"
    t.integer  "sexo"
    t.date     "fecha_nacimiento"
    t.string   "especialidad"
    t.string   "cmv"
    t.text     "cv"
    t.string   "url"
    t.integer  "usuario_id",           default: 0
    t.string   "centro_salud"
    t.string   "servicio_medico"
    t.string   "modalidad_consulta"
    t.text     "horario_consulta"
    t.string   "precio_consulta"
    t.string   "telefono_consultorio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "tipo_usuario"
    t.integer  "medico_id",       default: 0
    t.integer  "centro_salud_id", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "register_flag",   default: "0"
    t.integer  "rol_id",          default: 0
  end

  add_index "usuarios", ["remember_token"], name: "index_usuarios_on_remember_token"
  add_index "usuarios", ["rol_id"], name: "index_usuarios_on_rol_id"

end
