class FinishedEvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:answers]
   before_action :set_finished_evaluation, only: [:show, :edit, :update, :destroy]

  def index
    @finished_evaluations = FinishedEvaluation.all
  end

  def show
  end

  # def answers
  #   @questions = @evaluation.questions
  # end

  # def new
  #   @finished_evaluation = FinishedEvaluation.new
  # end

  def edit
  end

  def create
    binding.pry

    @finished_evaluation = FinishedEvaluation.new(finished_evaluation_params)

    respond_to do |format|
      if @finished_evaluation.save

        format.html { redirect_to @finished_evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evaluation }
      else
        format.html { render action: 'new' }
        format.json { render json: @finished_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @finished_evaluation.update(evaluation_params)
        format.html { redirect_to @finished_evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @finished_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @finished_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @finished_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def set_finished_evaluation
    @finished_evaluation = FinishedEvaluation.find(params[:id])
  end

  def finished_evaluation_params
    params.require(:finished_evaluation).permit(:evaluation_id, :course_id, :attendee_id, :answers_attributes => [:content, :question_id, :attendee_id])
  end

end
