class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

private
  def set_course
    @course = Course.find(params[:id])
  end

end
