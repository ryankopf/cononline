class UserMailer < ApplicationMailer
  def new_user_email
    @user = params[:user]
    mail(to: @user.email, subject: "Your convention login link.")
  end
end