class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

private

  def set_instructor
    @course = Course.find(params[:id])
  end
end
