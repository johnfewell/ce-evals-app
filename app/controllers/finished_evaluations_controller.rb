class FinishedEvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]

  # def index
  #   @evaluations = Evaluation.all
  # end
  #
  # def show
  #   @questions = @evaluation.questions
  # end

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
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evaluation }
      else
        format.html { render action: 'new' }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def finished_evaluation_params
    params.require(:finished_evaluation).permit(:name, :course_id, :question_ids => [], :questions_attributes => [:content])
  end
#:answers_attributes => [:content, :attendee_id])



end
