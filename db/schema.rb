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

ActiveRecord::Schema.define(version: 20140722193508) do

  create_table "centro_saluds", force: true do |t|
    t.string   "email"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicos", force: true do |t|
    t.string   "email"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.text     "direccion"
    t.string   "telefono_casa"
    t.string   "telefono_celular"
    t.string   "telefono_oficina"
    t.string   "sexo"
    t.date     "fecha_nacimiento"
    t.string   "especialidad"
    t.string   "cmv"
    t.text     "cv"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
