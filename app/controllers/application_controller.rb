class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  end
end
