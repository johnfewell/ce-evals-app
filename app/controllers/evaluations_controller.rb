class EvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]

  def index
    @evaluations = Evaluation.all
  end

  def show
    @questions = @evaluation.questions
  end

  def assigned
    @evaluations = Evaluation.assigned
  end

  def unassigned
    @evaluations = Evaluation.unassigned
  end

  def answers
    @attendee = Attendee.find(params[:attendee_id])
    evaluation = Evaluation.find(params[:id])
    @course = Course.find(evaluation.course.id)

    if !@attendee.courses.include?(@course)
      redirect_to @attendee, notice: "#{@attendee.fullname} was not registered for this course."
    end

    if !@course.complete?
      redirect_to @attendee, notice: "#{@course.title} is not over yet."
    end

    @finished_evaluation = FinishedEvaluation.new
    @questions = @evaluation.questions
  end

  def new
    @evaluation = Evaluation.new
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to @evaluation, notice: 'Evaluation was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully deleted.'
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:name, :course_id, :question_ids => [], :questions_attributes => [:content])
  end

end
