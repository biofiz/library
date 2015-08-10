class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :verify_admin
  load_and_authorize_resource

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
