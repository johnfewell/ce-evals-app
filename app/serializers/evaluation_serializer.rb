class EvaluationSerializer < ActiveModel::Serializer
  attributes :id, :name, :next, :previous
  belongs_to :course, optional: true
  has_many :questions
end

# create_table "evaluations", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "course_id"
# end
