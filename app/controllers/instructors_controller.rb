class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :profile, :edit, :update, :destroy]

  def index
    @instructors = Instructor.all
  end

  def show
  end

  def profile
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to @instructor, notice: 'Instructor was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      redirect_to profile_instructor_path(@instructor), notice: 'Instructor was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @instructor.destroy
    redirect_to instructors_url, notice: 'Instructor was successfully deleted.'
  end

private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :title, :suffix, :instructor_ids => [])
  end

end
