class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :attendee
  belongs_to :finished_evaluation
end

class FinishedEvaluation < ApplicationRecord
  has_many :answers
  belongs_to :attendee, optional: true
  belongs_to :evaluation, optional: true
  belongs_to :course, optional: true
  #accepts_nested_attributes_for :answers
# "attendee_id"=>"1", "evaluation_id"=>"1"
  def answers_attributes=(answers_hashes)
    answers_hashes.each do |i, answer_attributes|
      answer = Answer.create(content: answer_attributes[:content], attendee_id: answer_attributes[:attendee_id], evaluation_id: answer_attributes[:evaluation_id])
      self.answers.build(:answer => answer)
    end
  end
end

create the form that will send the needed info
create n of new Answer s
associate new Answer s with @attendee via :id, with @question via ?,
create a new FinishedEvaluation and assoicate the new Answer s with it

"finished_evaluation"=>
{"questions"=>
  {"answers_attributes"=>
    {"0"=>
      {"content"=>"last", "question_id"=>"4", "attendee_id"=>"1", "evaluation_id"=>"1"}}}}, "commit"=>"Create Finished evaluation", "controller"=>"finished_evaluations", "action"=>"create"} permitted: false>



 # "finished_evaluation"=>
 # {"questions"=>
 #   {"answers_attributes"=>
 #     {"0"=>
 #       {"content"=>"Last", "attendee_id"=>"1", "evaluation_id"=>"1"}}}},
 #       "commit"=>"Create Finished evaluation",
 #       "controller"=>"finished_evaluations",
 #       "action"=>"create"}
