# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
# This is causing the files to load in the wrong order
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
# Temporary fix, load them in this order:
require_relative 'support/session_helpers' 
require_relative 'support/features'

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
