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

ActiveRecord::Schema[7.0].define(version: 2023_09_19_105604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "tutor_id", null: false
    t.bigint "subject_id", null: false
    t.boolean "accepted"
    t.string "student_objective"
    t.date "first_session_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_matches_on_student_id"
    t.index ["subject_id"], name: "index_matches_on_subject_id"
    t.index ["tutor_id"], name: "index_matches_on_tutor_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.boolean "plus"
    t.date "starting_on"
    t.date "expiring_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_memberships_on_student_id"
  end

  create_table "proposed_dates", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.date "proposed_date_1"
    t.date "proposed_date_2"
    t.date "proposed_date_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_proposed_dates_on_match_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "university_id", null: false
    t.integer "starting_year_univ"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_students_on_university_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subject_per_univs", force: :cascade do |t|
    t.bigint "university_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_subject_per_univs_on_subject_id"
    t.index ["university_id"], name: "index_subject_per_univs_on_university_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutor_availabilities", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.string "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_tutor_availabilities_on_tutor_id"
  end

  create_table "tutor_per_subjects", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_tutor_per_subjects_on_subject_id"
    t.index ["tutor_id"], name: "index_tutor_per_subjects_on_tutor_id"
  end

  create_table "tutor_per_univs", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "university_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_tutor_per_univs_on_tutor_id"
    t.index ["university_id"], name: "index_tutor_per_univs_on_university_id"
  end

  create_table "tutor_prices", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.integer "group_1"
    t.integer "group_2"
    t.integer "group_3"
    t.integer "group_4_more"
    t.integer "group_1_plus"
    t.integer "group_2_plus"
    t.integer "group_3_plus"
    t.integer "group_4_more_plus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_tutor_prices_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "about"
    t.text "methodology"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tutor"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "students"
  add_foreign_key "matches", "subjects"
  add_foreign_key "matches", "tutors"
  add_foreign_key "memberships", "students"
  add_foreign_key "proposed_dates", "matches"
  add_foreign_key "students", "universities"
  add_foreign_key "students", "users"
  add_foreign_key "subject_per_univs", "subjects"
  add_foreign_key "subject_per_univs", "universities"
  add_foreign_key "tutor_availabilities", "tutors"
  add_foreign_key "tutor_per_subjects", "subjects"
  add_foreign_key "tutor_per_subjects", "tutors"
  add_foreign_key "tutor_per_univs", "tutors"
  add_foreign_key "tutor_per_univs", "universities"
  add_foreign_key "tutor_prices", "tutors"
  add_foreign_key "tutors", "users"
end
