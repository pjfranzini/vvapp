ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

#Getting capybara ready for use
require "capybara/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: 'password123'
    click_button 'btn-Connect'
  end

  def set_real_submission(user)
    @sub = Submission.new
    @sub.artist_statement = File.open("#{Rails.root}/test/fixtures/documents/statement.pdf")
    @sub.expo_project = File.open("#{Rails.root}/test/fixtures/documents/expo.pdf")
    @sub.cv = File.open("#{Rails.root}/test/fixtures/documents/cv.pdf")
    @sub.image_list = File.open("#{Rails.root}/test/fixtures/documents/image_list.pdf")
    @sub.user = user
    @sub.save
  end
end
