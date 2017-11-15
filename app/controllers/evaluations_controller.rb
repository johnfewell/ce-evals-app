class EvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]

  def index
  end

  def show
  end

  def answers
    @attendees = Attendee.all
    @questions = @evaluation.questions
    render :answers 
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def survey_params
    params.require(:evaluation).permit(:name,
      :questions_attributes => [:id, :content,
        :answers_attributes => [:id, :content, :attendee_id]
      ])
  end
end
