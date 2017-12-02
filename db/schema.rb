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

ActiveRecord::Schema.define(version: 20171202211348) do

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
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.integer "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_questions_on_evaluation_id"
  end

end
