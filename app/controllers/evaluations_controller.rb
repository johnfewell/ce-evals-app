class EvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]

  def index
    @evaluations = Evaluation.all
  end

  def show
    @questions = @evaluation.questions
  end

  def answers
    @attendees = Attendee.all
    @questions = @evaluation.questions
  end

  def new
    @evaluation = Evaluation.new
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'evaluation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evaluation }
      else
        format.html { render action: 'new' }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    binding.pry
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'evaluation was successfully updated.' }
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
      format.html { redirect_to evaluations_url, notice: 'evaluation was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:name,
      :questions_attributes => [:id, :content,
        :answers_attributes => [:id, :content, :attendee_id]
      ])
  end
end
