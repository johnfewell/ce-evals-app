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
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def assign_role
  end

  def unassigned
  end

  def update_role
    if !user_params[:attendee_id].empty? && !user_params[:instructor_id].empty?
      redirect_to update_role_user_path, notice: 'You must choose either a instructor or attendee role, not both.'
    elsif !user_params[:attendee_id].empty?

      #this code is insane and needs to be refactored

      @attendee = Attendee.find(user_params[:attendee_id])

      @user.update({
        :first_name => user_params[:first_name],
        :last_name => user_params[:last_name],
        :title => user_params[:title],
        :suffix => user_params[:suffix],
        :user_id => @user.id,
        :superadmin_role => false,
        :instructor_role => false,
        :attendee_role => true })

      @attendee.update({
        :first_name => user_params[:first_name],
        :last_name => user_params[:last_name],
        :title => user_params[:title],
        :suffix => user_params[:suffix],
        :user_id => @user.id })

      @attendee = Attendee.find(user_params[:attendee_id])

      @user.update({
        :first_name => @attendee.first_name,
        :last_name => @attendee.last_name,
        :title => @attendee.title, :suffix => @attendee.suffix })

      redirect_to users_path, notice: 'User was successfully assigned.'

      # end of crazy code

    elsif !user_params[:instructor_id].empty?
      @instructor = Instructor.find(user_params[:instructor_id])

      @user.update({
        :first_name => user_params[:first_name],
        :last_name => user_params[:last_name],
        :title => user_params[:title],
        :suffix => user_params[:suffix],
        :user_id => @user.id,
        :superadmin_role => false,
        :instructor_role => true,
        :attendee_role => false })

      @instructor.update({
        :first_name => user_params[:first_name],
        :last_name => user_params[:last_name],
        :title => user_params[:title],
        :suffix => user_params[:suffix],
        :user_id => @user.id })

      @instructor = Instructor.find(user_params[:instructor_id])

      @user.update({
        :first_name => @instructor.first_name,
        :last_name => @instructor.last_name,
        :title => @instructor.title, :suffix => @instructor.suffix })

      redirect_to users_path, notice: 'User was successfully assigned.'

    else
      @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully deleted.'
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :title, :suffix, :attendee_id, :instructor_id)
  end

end
