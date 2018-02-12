class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_evaluation, only: [:update]
  before_action :is_authorized?

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def import
    @question = Question.find(params[:id])
    Attendee.import(params[:file])
    redirect_to root_url, notice: "Attendee data imported!"
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    # sets the owner of the question to the current user's instructor id
    if current_user.instructor_role?
      @question.instructor_id = current_user.instructor.id
    elsif current_user.superadmin_role?
      @question.instructor_id = 1
    end

    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @question.instructor_id = current_user.instructor.id
    if @question.update(question_params)
      #@evaluation will be nil if user edits the question when creating a new evaluation
      if @evaluation.nil?
        redirect_to new_evaluation_path, notice: 'Question was successfully updated.'
      else
        #evaluation will have an id if user edited the quetions from an existing evaluation
        redirect_to edit_evaluation_path(@evaluation), notice: 'Question was successfully updated.'
      end
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to courses_url, notice: 'Question was successfully deleted.'
  end

private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :ref_id, :text)
  end

  def set_evaluation
    if !params[:ref_id].empty?
      @evaluation = Evaluation.find(params[:ref_id])
    end
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
