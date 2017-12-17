class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :assign_role, :update_role]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def registration
    @courses = Course.where.has { end_date > Date.today }
  end

  def edit
  end

  def assign_role
  end

  def update_role
    binding.pry
    if !user_params[:attendee_id].empty? && !user_params[:instructor_id].empty?
      redirect_to update_role_user_path, notice: 'You must choose either a instructor or attendee role, not both.'
    elsif !user_params[:attendee_id].empty?
      @attendee = Attendee.find(user_params[:attendee_id])
      @attendee.update({ :first_name => user_params[:first_name], :last_name => user_params[:last_name], :title => user_params[:title], :suffix => user_params[:suffix], :user_id => @user.id })
      redirect_to @user, notice: 'User was successfully assigned.'
    elsif !user_params[:instructor_id].empty?
      @instructor = Instructor.find(user_params[:instructor_id])
      @instructor.update({ :first_name => user_params[:first_name], :last_name => user_params[:last_name], :title => user_params[:title], :suffix => user_params[:suffix], :user_id => @user.id })
      redirect_to @user, notice: 'User was successfully assigned.'
    else
      @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.'}
      format.json { head :no_content }
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :suffix, :attendee_id, :instructor_id)
  end


end