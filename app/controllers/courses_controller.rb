require 'pry'
class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def import
    binding.pry
    @course = Course.find(params[:id])

    Attendee.import(params[:file])
    redirect_to root_url, notice: "Attendee data imported!"
  end


  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully deleted.'}
      format.json { head :no_content }
    end
  end

private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :location, :credits, :learning_objective_1, :learning_objective_2, :learning_objective_3, :start_date, :end_date, :published, :instructor_id, :evaluation_id)
  end



end
