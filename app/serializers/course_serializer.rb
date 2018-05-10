class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date
  has_one :evaluation
end
