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

ActiveRecord::Schema.define(:version => 20130627035948) do

  create_table "calificacion", :id => false, :force => true do |t|
    t.integer "ID",                           :null => false
    t.integer "CLASE_ID",                     :null => false
    t.integer "ESTUDIANTE_ID",                :null => false
    t.string  "COMENTARIO",    :limit => 500
    t.integer "NOTA"
  end

  add_index "calificacion", ["CLASE_ID"], :name => "fk_CALIFICACION_CLASE1"
  add_index "calificacion", ["ESTUDIANTE_ID"], :name => "fk_CALIFICACION_ESTUDIANTE1"

  create_table "clase", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "SECCION_ID",  :null => false
    t.integer "PROFESOR_ID", :null => false
    t.integer "HORARIO_ID",  :null => false
    t.integer "MATERIA_ID",  :null => false
  end

  add_index "clase", ["HORARIO_ID"], :name => "fk_CLASE_HORARIO1_idx"
  add_index "clase", ["MATERIA_ID"], :name => "fk_CLASE_CATALOGO_MATERIAS1_idx"
  add_index "clase", ["PROFESOR_ID"], :name => "fk_CLASE_PROFESOR1"
  add_index "clase", ["SECCION_ID"], :name => "fk_CLASE_SECCION1"

  create_table "clase_estudiante", :id => false, :force => true do |t|
    t.integer "CLASE_ID",      :null => false
    t.integer "ESTUDIANTE_ID", :null => false
    t.integer "APROBADO"
  end

  add_index "clase_estudiante", ["CLASE_ID"], :name => "fk_CLASE_has_ESTUDIANTE_CLASE"
  add_index "clase_estudiante", ["ESTUDIANTE_ID"], :name => "fk_CLASE_has_ESTUDIANTE_ESTUDIANTE1"

  create_table "estudiante", :id => false, :force => true do |t|
    t.integer "ID",                              :null => false
    t.string  "MATRICULA",         :limit => 45
    t.string  "MATRICULA_EXTERNA", :limit => 45
    t.integer "PERSONA_ID",                      :null => false
  end

  add_index "estudiante", ["MATRICULA"], :name => "MATRICULA_UNIQUE", :unique => true
  add_index "estudiante", ["PERSONA_ID"], :name => "fk_ESTUDIANTE_PERSONA1"

  create_table "estudiantes", :force => true do |t|
    t.string   "matricula"
    t.string   "primer_nombre"
    t.string   "primer_apellido"
    t.integer  "grado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historial", :id => false, :force => true do |t|
    t.integer "ID",                             :null => false
    t.string  "COMENTARIO",     :limit => 1000
    t.integer "ESTUDIANTE_ID",                  :null => false
    t.integer "INSTITUCION_ID",                 :null => false
    t.integer "TIPO_ID",                        :null => false
  end

  add_index "historial", ["ESTUDIANTE_ID"], :name => "fk_HISTORIAL_ESTUDIANTE1"
  add_index "historial", ["INSTITUCION_ID"], :name => "fk_HISTORIAL_INSTITUCION1"
  add_index "historial", ["TIPO_ID"], :name => "fk_HISTORIAL_TIPO1"

  create_table "horario", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.time    "HORA_INICIO", :null => false
    t.time    "HORA_FIN",    :null => false
    t.integer "TIPO_ID",     :null => false
  end

  add_index "horario", ["TIPO_ID"], :name => "fk_HORARIO_TIPO1"

  create_table "institucion", :primary_key => "ID", :force => true do |t|
    t.string "NOMBRE",    :limit => 45, :null => false
    t.string "DIRECCION", :limit => 45, :null => false
    t.string "TELEFONO",  :limit => 45
    t.string "PAIS",      :limit => 45
    t.string "CIUDAD",    :limit => 45
  end

  add_index "institucion", ["ID"], :name => "ID_UNIQUE", :unique => true

  create_table "materia", :force => true do |t|
    t.string   "nombre"
    t.integer  "tipo_grado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagos", :primary_key => "ID", :force => true do |t|
    t.date   "FECHA_PAGO"
    t.string "MONTO",      :limit => 45
  end

  create_table "periodo_academico", :id => false, :force => true do |t|
    t.integer "ID",            :null => false
    t.date    "FECHA_INICIAL", :null => false
    t.date    "FECHA_FINAL",   :null => false
    t.integer "TIPO_ID",       :null => false
  end

  add_index "periodo_academico", ["TIPO_ID"], :name => "fk_PERIODO_ACADEMICO_TIPO1_idx"

  create_table "persona", :id => false, :force => true do |t|
    t.integer "ID",                              :null => false
    t.string  "PRIMER_NOMBRE",    :limit => 45,  :null => false
    t.string  "SEGUNDO_NOMBRE",   :limit => 45
    t.string  "PRIMER_APELLIDO",  :limit => 45,  :null => false
    t.string  "SEGUNDO_APELLIDO", :limit => 45
    t.string  "CEDULA",           :limit => 11
    t.integer "TELEFONO1",                       :null => false
    t.integer "TELEFONO2"
    t.string  "DIRECCION1",       :limit => 500, :null => false
    t.string  "DIRECCION2",       :limit => 45
    t.string  "NACIONALIDAD",     :limit => 45,  :null => false
    t.date    "FECHA_INGRESO",                   :null => false
    t.date    "FECHA_INACTIVO"
    t.integer "ACTIVO",                          :null => false
    t.string  "PASAPORTE",        :limit => 45
    t.integer "PAGOS_ID",                        :null => false
  end

  add_index "persona", ["CEDULA"], :name => "CEDULA_UNIQUE", :unique => true
  add_index "persona", ["ID"], :name => "ID_UNIQUE", :unique => true
  add_index "persona", ["PAGOS_ID"], :name => "fk_PERSONA_PAGOS1"
  add_index "persona", ["PASAPORTE"], :name => "PASAPORTE_UNIQUE", :unique => true

  create_table "personas", :force => true do |t|
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.string   "cedula"
    t.integer  "telefono1"
    t.integer  "telefono2"
    t.string   "direccion1"
    t.string   "direccion2"
    t.string   "nacionalidad"
    t.date     "fecha_ingreso"
    t.date     "fecha_inactivo"
    t.integer  "activo"
    t.string   "pasaporte"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesor", :id => false, :force => true do |t|
    t.integer "ID",                        :null => false
    t.string  "FORMACION",  :limit => 500
    t.float   "SALARIO"
    t.integer "PERSONA_ID",                :null => false
  end

  add_index "profesor", ["PERSONA_ID"], :name => "fk_PROFESOR_PERSONA1"

  create_table "profesor_da_materia", :force => true do |t|
    t.integer  "profesor_id"
    t.integer  "materia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesors", :force => true do |t|
    t.string   "primer_nombre"
    t.string   "primer_apellido"
    t.string   "cedula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seccion", :id => false, :force => true do |t|
    t.integer "ID",                                  :null => false
    t.string  "NOMBRE",                :limit => 45
    t.string  "POSTFIJO",              :limit => 1
    t.integer "PERIODO_ACADEMICO_ID",                :null => false
    t.integer "PROFESOR_ID",                         :null => false
    t.integer "TIPO_ID_ANO_ACADEMICO",               :null => false
  end

  add_index "seccion", ["PERIODO_ACADEMICO_ID"], :name => "fk_SECCION_ANO_ACADEMICO1"
  add_index "seccion", ["PROFESOR_ID"], :name => "fk_SECCION_PROFESOR1"
  add_index "seccion", ["TIPO_ID_ANO_ACADEMICO"], :name => "fk_SECCION_TIPO1"

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo", :primary_key => "ID", :force => true do |t|
    t.string  "NOMBRE",    :limit => 45
    t.integer "CATEGORIA"
  end

  create_table "tipos", :force => true do |t|
    t.string   "nombre"
    t.string   "categoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
