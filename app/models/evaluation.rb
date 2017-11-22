class Evaluation < ApplicationRecord
  has_many :questions
  belongs_to :course, optional: true
  has_many :finished_evaluations
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['content'].blank?}
  validates_presence_of :content

  # def questions=(question)
  #   question.each do |q|
  #     if !q[:content].empty?
  #       if new_q = Question.find_by(content: q[:content])
  #         self.questions << new_q
  #       else
  #         self.question.build(content: q[:content])
  #       end
  #     end
  #   end
  # end

end
