$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gt_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gt_auth"
  s.version     = GtAuth::VERSION
  s.authors     = ["Jack Flannery"]
  s.email       = ["jmflannery81@gmail.com"]
  s.homepage    = "http://jackflannery.net"
  s.summary     = "Authentication engine for the Grand Tour CMS."
  s.description = "Authentication engine for the Grand Tour CMS."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "pg"
  s.add_dependency "jquery-rails"
  s.add_dependency "handlebars-source", "~> 1.0.0.rc3"
  s.add_dependency "ember-rails", "~> 0.12.0"
  s.add_dependency "ember-source", "~> 1.0.0rc3.2"
  s.add_dependency "bcrypt-ruby"
  
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
