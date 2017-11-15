class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end
end
