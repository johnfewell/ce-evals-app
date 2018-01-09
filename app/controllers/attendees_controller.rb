class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy, :certificate]
  before_action :set_courses, only: [:new, :edit]
  before_action :set_course, only: [:certificate]

  def index
    @attendees = Attendee.all
  end

  def show
  end

  def certificate
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully deleted.'
  end

  def import
    Attendee.import(params[:file])
    redirect_to root_url, notice: "Attendee data imported!"
  end

private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def set_courses
    @courses = Course.not_complete.published
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :title, :suffix, :course_ids => [])
  end

end
