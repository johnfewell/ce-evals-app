class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_evaluation, only: [:update]

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
    @question.instructor_id = current_user.instructor.id
    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @question.instructor_id = current_user.instructor.id
    if @question.update(question_params)
      redirect_to edit_evaluation_path(@evaluation), notice: 'Question was successfully updated.'
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

end
