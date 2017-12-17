class FinishedEvaluation < ApplicationRecord
  has_many :answers
  belongs_to :attendee, optional: true
  belongs_to :evaluation, optional: true
  belongs_to :course, optional: true

  def answers_attributes=(answers_hashes)
    answers_hashes.each do |i, answer_attributes|
      answer = Answer.create(content: answer_attributes[:content], attendee_id: answer_attributes[:attendee_id], question_id: answer_attributes[:question_id])
      binding.pry
      #answer.rate

      self.answers << answer
    end
  end
end
