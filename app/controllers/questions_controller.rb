class QuestionsController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
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
    @question = Question.new(course_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: questions_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(course_params)
        format.html { redirect_to edit_evaluation_path(@evaluation), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Question was successfully deleted.'}
      format.json { head :no_content }
    end
  end

private
  def set_course
    @question = Question.find(params[:id])
  end

  def course_params
    params.require(:question).permit(:content, :evaluation_id, :refer_id)
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:ref_id])
  end

end
