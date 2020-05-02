class User < ApplicationRecord
  after_create :setup_login_information
  after_create :send_login_link
  after_create :first_is_admin
  has_many :vendors
  has_many :products, through: :vendors
  has_many :attendees
  has_one :cart
  attr_accessor :dont_email
  validates :email, uniqueness: true

  def setup_login_information
    self.key = SecureRandom.hex
    self.key_made_at = Time.now
    self.save
  end

  def send_login_link
    UserMailer.with(user: self).new_user_email.deliver_later unless dont_email
  end

  def admin?
    self.is_admin
  end

  def first_is_admin
    if User.all.size < 2
      self.update_attribute(:is_admin, true)
    end
  end

end
