class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy, :registration]

  def index
    @attendees = Attendee.all
  end

  def registration
    @courses = Course.where.has { end_date > Date.today }
  end

  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end

private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :course_ids => [])
  end

end
