class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy, :registration]

  def index
    @attendees = Attendee.all
  end

  def registration
    @courses = Course.where.has { end_date > Date.today }
  end

  def show
  end

private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end
end
