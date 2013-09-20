$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smithy/auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smithy-auth"
  s.version     = Smithy::Auth::VERSION
  s.authors     = ["Tim Glen"]
  s.email       = ["tim@tag.ca"]
  s.homepage    = "https://github.com/sterrym/smithy-auth"
  s.summary     = "Provides basic authentication to Smithy CMS"
  s.description = "Smithy CMS ships with no authentication. This implements a basic has_secure_password in a Smithy::User model"

  s.required_ruby_version = '>= 1.9.3'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'bcrypt-ruby', '~> 3.0.0'
  s.add_dependency 'smithy'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'sqlite3'
end
