class EvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]
   before_action :is_authorized?, only: [:index, :new, :show, :edit, :update, :destroy]

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
    #prevent instructors from completing evaluations
    if current_user.instructor_role?
      redirect_to profile_instructor_path, alert: "You can't complete evaluation forms."

    #checks to see if the current_user is acess
    elsif params[:attendee_id] == current_user.attendee.id.to_s || current_user.superadmin_role?
      @attendee = Attendee.find(params[:attendee_id])
      evaluation = Evaluation.find(params[:id])
      @course = Course.find(evaluation.course.id)

      if !@attendee.courses.include?(@course)
        redirect_to @attendee, alert: "#{@attendee.fullname} was not registered for this course."
      end

      if !@course.complete?
        redirect_to @attendee, alert: "#{@course.title} is not over yet."
      end

      @finished_evaluation = FinishedEvaluation.new
      @questions = @evaluation.questions
    else
      redirect_to root_path, alert: "Don't try to URL hack me."
    end
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

  def is_authorized?
    if current_user.superadmin_role
      true
    elsif current_user.instructor_role
      true
    elsif current_user.attendee_role
      redirect_to profile_attendee_path(current_user.attendee.id), alert: "You aren't authorized to see that page."
    else
      redirect_to root_url, alert: "Something weird happened."
    end
  end

end
