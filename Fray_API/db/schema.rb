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

ActiveRecord::Schema.define(:version => 20130714191632) do

  create_table "grades", :force => true do |t|
    t.string   "comment"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lecture_id"
    t.integer  "student_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "suffix"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "period_id"
    t.integer  "teacher_id"
    t.integer  "stage_id"
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "schedule_id"
    t.integer  "subject_id"
    t.integer  "teacher_id"
  end

  create_table "periods", :force => true do |t|
    t.date     "init_date"
    t.date     "end_date"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.string   "comment"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "institution_id"
  end

  create_table "schedules", :force => true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.string   "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stage_id"
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "kind"
    t.string   "enrollment_code"
    t.string   "enrollment_outer_code"
    t.string   "studies"
    t.string   "salary"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "first_last_name"
    t.string   "second_last_name"
    t.string   "identification_card"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "nationality"
    t.date     "registration_date"
    t.date     "inactivity_date"
    t.boolean  "active"
    t.string   "passport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
