class EvaluationSerializer < ActiveModel::Serializer
  attributes :id, :name, :next, :previous
  belongs_to :course, optional: true
  has_many :questions
end
