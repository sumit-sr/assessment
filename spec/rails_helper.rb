# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rake'
require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rails'
require 'capybara/rspec'
require 'rspec/retry'
require 'devise'


module TestApplicationHelpers

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryGirl.create(:user)
    sign_in(@current_user, scope: :user)
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  config.include Shoulda::Callback::Matchers::ActiveModel
  config.include TestApplicationHelpers

  config.exceptions_to_retry = [Net::ReadTimeout]

  config.order = "random"
  config.color = true
  config.infer_base_class_for_anonymous_controllers = false
  config.raise_errors_for_deprecations!

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.global_fixtures = :all
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    #load "#{Rails.root}/db/seeds/development.rb"
    #Aqua::Application.load_tasks
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.javascript_driver = :selenium
  Capybara.server_port = 3001
  Capybara.app_host = "http://localhost:3000"
  ActionController::Base.asset_host = Capybara.app_host
end
