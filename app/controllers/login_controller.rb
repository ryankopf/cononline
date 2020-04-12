class LoginController < ApplicationController

  def login
    u = User.find_by(id: params[:id], key: params[:key])
    if Rails.env == "test"
      u = User.find(params[:id])
    end
    if u.nil?
      redirect_to "/signup"
      return true
    end
    u.update_attribute(:email_verified,true) unless u.email_verified
    request.session[:user_id] = u.id
    @current_user = u
    redirect_to "/"
  end

  def logout
    request.session[:user_id] = nil
    @current_user = nil
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js { render js: "window.location = '/';" }
    end
  end

  def reset
    u = User.find_by(email: params[:email])
    u.send_login_link
    redirect_to "/", notice: 'Sending reset link.'
  end

end
