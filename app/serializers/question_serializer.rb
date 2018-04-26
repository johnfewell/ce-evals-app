class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :text
  belongs_to :evaluation
end
