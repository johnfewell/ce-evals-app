class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date
  has_one :evaluation
end

# create_table "courses", force: :cascade do |t|
#   t.string "title"
#   t.string "location"
#   t.float "credits"
#   t.text "learning_objective_1"
#   t.text "learning_objective_2"
#   t.text "learning_objective_3"
#   t.date "start_date"
#   t.date "end_date"
#   t.boolean "published"
#   t.integer "instructor_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "evaluation_id"
# end
