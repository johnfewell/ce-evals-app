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
    # These are the custom redirects for successful sign ins.
    # def after_sign_in_path_for(resource)
    #   # if the user is an attendee, redirect them to their show page
    #   if current_user.attendee_role && current_user.attendee
    #      attendee_url(current_user.attendee)
    #   # if the user is an instructor, redirect them to their show page
    # elsif current_user.instructor_role && current_user.instructor
    #     instructor_url(current_user.instructor)
    #   # if the user is a superadmin, redirect them to the attendees index
    #   elsif current_user.superadmin_role
    #     admin_path
    #   # else, redirect them to a page that tells them to sit tight until they are assigned a role
    #   else
    #     root_url #I need to create a page for users who are not yet assigned
    #   end
    #end

end
