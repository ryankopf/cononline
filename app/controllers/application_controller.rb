class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    current_user
  end

  protected
  def require_login
    redirect_to '/signup' if current_user.nil?
  end
  def current_user
    @current_user ||= login_from_session
  end
  def login_from_session
    request.session[:user_id] ? User.find_by(id: request.session[:user_id]) : nil
  end
  def require_admin
    redirect_to '/signup' unless @current_user&.admin?
  end

end
