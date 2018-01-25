require 'pry'
class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :report]
  before_action :is_authorized?, only: [:edit, :new, :update, :destroy, :report, :draft]

  def index
    @courses = Course.all
  end

  def finished
    @courses = Course.complete.published
  end

  def current
    @courses = Course.not_complete.started.published
  end

  def upcoming
    @courses = Course.upcoming.published
  end

  def draft
    @courses = []
    if current_user.instructor_role?
      Course.unpublished.each do |c|
        if c.instructor_id == current_user.instructor.id
          @courses << c
        end
      end
    else
      @courses = Course.unpublished
  end
end

  def show
    if @course.published == false
      flash[:alert] = "This course is unpublished"
    end
  end

  def new
    @course = Course.new
  end

  def report
    if @course.finished_evaluations.count > 0
      percent = @course.finished_evaluations.count.to_f / @course.attendees.count.to_f * 100
      @evaluation_completed_percent = percent.round(2)
    else
      @evaluation_completed_percent = 0
    end

    @course.finished_evaluations.last.questions_ratings_hash

    keys = []
    values = []
    @course.finished_evaluations.each do |fe|
      fe.answers.each do |a|
        if a.content.nil?
          values << a.rating.average.to_f
          keys << a.question.content
        end
      end
    end
    @questions_ratings_hash = Hash[keys.zip(values)]

    keys = []
    values = []
    @course.finished_evaluations.each do |fe|
      fe.answers.each do |a|
        if !a.content.nil?
          values << a.content
          keys << a.question.content
        end
      end
    end
    pairs = keys.zip(values)
    @questions_answers_hash = pairs.group_by(&:first)
    @questions_answers_hash.keys.each {
      |k| @questions_answers_hash[k] = @questions_answers_hash[k].map(&:last) }
  end

  def import
    course = Course.find(params[:id])
    Attendee.import(params[:file], course)
    redirect_to course_path(course), notice: "Attendee data imported!"
  end

  def edit
  end

  def create
  @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      format.html { render :edit }
    end

  end

  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully deleted.'
  end

private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :location, :credits, :learning_objective_1, :learning_objective_2, :learning_objective_3, :start_date, :end_date, :published, :instructor_id, :evaluation_id)
  end

  def is_authorized?
    if current_user.superadmin_role
      true
    elsif current_user.instructor_role
      true
    elsif @attendee
      if current_user.id == @attendee.user_id
        true
      else
        redirect_to root_url, alert: "You aren't authorized to see that page."
      end
    else
      redirect_to root_url, alert: "Something weird happened."
    end
  end

end
