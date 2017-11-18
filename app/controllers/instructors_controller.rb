class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def index
    @instructors = Instructor.all
  end

  def show
  end

private

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end
end
