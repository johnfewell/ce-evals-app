class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :profile, :edit, :update, :destroy, :certificate]
  before_action :set_courses, only: [:new, :edit]
  before_action :set_course, only: [:certificate]
  before_action :is_authorized?

  def index
    @attendees = Attendee.all
  end

  def show
  end

  def profile
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
      redirect_to profile_instructor_path(@attendee), notice: 'Attendee was successfully updated.'
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

  def is_authorized?
    if current_user.superadmin_role
      true
    elsif current_user.instructor_role
      true
    elsif @attendee
      if current_user.id == @attendee.user_id
        true
      else
        redirect_to profile_attendee_path(current_user.attendee.id), alert: "You aren't authorized to see that page."
      end
    else
      redirect_to root_url, alert: "Something weird happened."
    end
  end

end
