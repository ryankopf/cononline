class Vendor < ApplicationRecord
  after_create :send_approval_email
  belongs_to :user
  has_one_attached :image
  has_many :products, dependent: :destroy
  validate :check_website_url

  def check_website_url
    return if self.website_url.blank?
    self.website_url = self.website_url.prepend('http://') unless self.website_url.include?('http')
  end

  def send_approval_email
    VendorMailer.with(vendor: self).new_vendor_email.deliver_later
  end

end
