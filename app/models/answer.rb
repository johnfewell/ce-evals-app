class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :attendee
  belongs_to :finished_evaluation
end
