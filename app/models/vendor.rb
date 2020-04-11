class Vendor < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :products, dependent: :destroy
  #validates :check_website
  #
  # def check_website
  #   return if self.website.blank?
  #   self.website = self.website.unshift('http://') unless self.website.include?('http')
  # end


end
