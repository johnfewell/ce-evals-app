class EvaluationsController < ApplicationController
   before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :answers]
   before_action :is_authorized?, only: [:index, :new, :show, :edit, :update, :destroy]

  def index
    @evaluations = Evaluation.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @evaluations, status: 200 }
    end
  end

  def show
    @previous_evaluation = @evaluation.next&.id
    @next_evaluation = @evaluation.previous&.id
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @evaluation, status: 200 }
    end
  end

  def assigned
    @evaluations = Evaluation.assigned
    respond_to do |f|
      f.html { render :assigned }
      f.json { render json: @evaluations, status: 200 }
    end
  end

  def unassigned
    @evaluations = Evaluation.unassigned
    respond_to do |f|
      f.html { render :unassigned }
      f.json { render json: @evaluations, status: 200 }
    end
  end

  def new_question_form
    @question = Question.new
    render :layout => false
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
    @question = Question.new
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      render json: @evaluation, status: 201
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
    params.require(:evaluation).permit(:name, :course_id, :questions_attributes => [:id, :content, :text, :_destroy])
  end


  def is_authorized?
    # if current_user.superadmin_role
    #   true
    # elsif current_user.instructor_role
    #   true
    # elsif current_user.attendee_role
    #   redirect_to profile_attendee_path(current_user.attendee.id), alert: "You aren't authorized to see that page."
    # else
    #   redirect_to root_url, alert: "Something weird happened."
    # end
  end

end
