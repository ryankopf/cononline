ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def initialize_data
    #host! "https://test.cononline.app"
    Rails.application.load_seed
  end

  def seed_and_login
    initialize_data
    get "/login/#{User.first.id}/#{User.first.key}"
  end

  # Add more helper methods to be used by all tests here...
end
