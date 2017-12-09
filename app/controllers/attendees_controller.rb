class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  before_action :set_courses, only: [:new, :edit]

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

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendee }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end

  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to attendees_url, notice: 'Attendee was successfully deleted.'}
      format.json { head :no_content }
    end
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
    @courses = Course.where.has { end_date > Date.today }
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :title, :suffix, :course_ids => [])
  end

end
