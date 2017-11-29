class Evaluation < ApplicationRecord
  has_many :evaluation_questions
  has_many :questions, :through => :evaluation_questions
  belongs_to :course, optional: true
  has_many :finished_evaluations
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['content'].blank?}

end
