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

ActiveRecord::Schema.define(version: 20180207180755) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "attendee_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "finished_evaluation_id"
    t.index ["attendee_id"], name: "index_answers_on_attendee_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attendees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "course_attendees", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.float "credits"
    t.text "learning_objective_1"
    t.text "learning_objective_2"
    t.text "learning_objective_3"
    t.date "start_date"
    t.date "end_date"
    t.boolean "published"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evaluation_id"
  end

  create_table "evaluation_questions", id: false, force: :cascade do |t|
    t.integer "evaluation_id", null: false
    t.integer "question_id", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "finished_evaluations", force: :cascade do |t|
    t.integer "attendee_id"
    t.integer "course_id"
    t.integer "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_finished_evaluations_on_attendee_id"
    t.index ["course_id"], name: "index_finished_evaluations_on_course_id"
    t.index ["evaluation_id"], name: "index_finished_evaluations_on_evaluation_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "text"
    t.integer "instructor_id"
  end

  create_table "rating_rates", force: :cascade do |t|
    t.decimal "value", precision: 17, scale: 14, default: "0.0"
    t.string "author_type", null: false
    t.integer "author_id", null: false
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type"
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "author_type", "resource_id", "resource_type", "scopeable_id", "scopeable_type"], name: "index_rating_rates_on_author_and_resource_and_scopeable", unique: true
    t.index ["author_type", "author_id"], name: "index_rating_rates_on_author_type_and_author_id"
    t.index ["resource_type", "resource_id"], name: "index_rating_rates_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_rates_on_scopeable_type_and_scopeable_id"
  end

  create_table "rating_ratings", force: :cascade do |t|
    t.decimal "average", precision: 17, scale: 14, default: "0.0"
    t.decimal "estimate", precision: 17, scale: 14, default: "0.0"
    t.integer "sum", default: 0
    t.integer "total", default: 0
    t.string "resource_type", null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type"
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id", "resource_type", "scopeable_id", "scopeable_type"], name: "index_rating_rating_on_resource_and_scopeable", unique: true
    t.index ["resource_type", "resource_id"], name: "index_rating_ratings_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_ratings_on_scopeable_type_and_scopeable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "instructor_role", default: false
    t.boolean "attendee_role", default: true
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "suffix"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
