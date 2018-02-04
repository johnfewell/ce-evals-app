class FinishedEvaluationsController < ApplicationController
   #before_action :set_evaluation, only: [:answers]
   before_action :set_finished_evaluation, only: [:show, :edit, :update, :destroy]
   before_action :set_attendee, only: [:show]
   before_action :is_authorized, only: [:index, :show, :edit, :update, :destroy]

  def index
    @finished_evaluations = FinishedEvaluation.all
  end

  def show
    keys = []
    values = []
    @finished_evaluation.evaluation.questions.each do |q|
      keys << q.content
    end
    @finished_evaluation.answers.each do |a|
      if !a.content.nil?
        values << a.content
      else
        final_rate = @attendee.rate_for a
        values << final_rate.value.to_i
      end
    end
    @questions_answers_hash = Hash[keys.zip(values)]
  end

  def edit
  end

  def create
    @finished_evaluation = FinishedEvaluation.new(finished_evaluation_params)
    if @finished_evaluation.save
      redirect_to attendee_path(current_user.attendee.id), notice: 'Evaluation was successfully created.'
    else
      render action: 'new'
    end
  end

# !!! there should not be an update path

  def update
    if @finished_evaluation.update(evaluation_params)
      redirect_to @finished_evaluation, notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @finished_evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully deleted.'
  end

  private

  def is_authorized
    if current_user.superadmin_role
      true
    else
      redirect_to root_url, alert: "You aren't authorized to see that page."
    end
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def set_finished_evaluation
    @finished_evaluation = FinishedEvaluation.find(params[:id])
  end

  def finished_evaluation_params
    params.require(:finished_evaluation).permit(:evaluation_id, :course_id, :attendee_id, :answers_attributes => [:content, :question_id, :attendee_id, :rating])
  end

  def set_attendee
    @attendee = Attendee.find(@finished_evaluation.attendee_id)
  end

end
