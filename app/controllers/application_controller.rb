class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    unless current_user.nil?
      redirect_to home(current_user)
    end
  end

  private

  def home(user)
    if current_user.attendee_role && !current_user.attendee.nil?
      attendee_url(user.attendee)
    elsif current_user.instructor_role
      instructor_url(user.instructor)
    elsif current_user.superadmin_role
      admin_path
    else
      unassigned_users_path
    end
  end

  protected
    
end
