class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :attendee
  belongs_to :finished_evaluation, optional: true

#  enum answer_rating: { strongly_disagree: 1, disagree: 2, neutral: 3, agree: 4, strongly_agree: 5}

  rating

end
