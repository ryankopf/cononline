class VendorMailer < ApplicationMailer
  def new_vendor_email
    @user = params[:user]
    mail(to: @user.email, subject: "A new vendor has applied for the con.")
  end
end