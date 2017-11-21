class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def index
    @instructors = Instructor.all
  end

  def show
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instructor }
      else
        format.html { render action: 'new' }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  def registration
    @courses = Course.where.has { end_date > Date.today }
  end

  def edit
  end

  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'Instructor was successfully deleted.'}
      format.json { head :no_content }
    end
  end

private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :title, :suffix, :instructor_ids => [])
  end

end
