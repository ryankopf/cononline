class VendorMailer < ApplicationMailer
  def new_vendor_email
    @vendor = params[:vendor]
    @users = User.where(is_admin: true)
    for @user in @users
      mail(to: @user.email, subject: "A new vendor has applied for the con.")
    end
  end
end