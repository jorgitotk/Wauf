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

ActiveRecord::Schema.define(version: 20160222204743) do

  create_table "teachers", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name",                            null: false
    t.string   "last_name",                             null: false
    t.string   "phone"
    t.boolean  "can_edit",               default: true, null: false
    t.string   "past_hours"
    t.string   "current_hours"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "username",                              null: false
    t.integer  "type_schedule"
    t.boolean  "can_register",           default: true, null: false
    t.integer  "type_hours"
    t.index ["email"], :name => "index_teachers_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true
    t.index ["username"], :name => "index_teachers_on_username", :unique => true
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer  "teacher_id", null: false
    t.integer  "day",        null: false
    t.time     "start_time", null: false
    t.time     "end_time",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], :name => "fk__availabilities_teacher_id"
    t.foreign_key ["teacher_id"], "teachers", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_availabilities_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], :name => "fk__courses_faculty_id"
  end

  create_table "course_teachers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], :name => "fk__course_teachers_course_id"
    t.index ["teacher_id"], :name => "fk__course_teachers_teacher_id"
    t.foreign_key ["course_id"], "courses", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_course_teachers_course_id"
    t.foreign_key ["teacher_id"], "teachers", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_course_teachers_teacher_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], :name => "fk__faculties_parent_id"
  end

  create_table "faculty_teachers", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], :name => "fk__faculty_teachers_faculty_id"
    t.index ["teacher_id"], :name => "fk__faculty_teachers_teacher_id"
    t.foreign_key ["faculty_id"], "faculties", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_faculty_teachers_faculty_id"
    t.foreign_key ["teacher_id"], "teachers", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_faculty_teachers_teacher_id"
  end

end
