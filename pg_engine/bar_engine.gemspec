$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bar_engine"
  s.version     = '0.0.1'
  s.authors     = ["Kelly Stannard"]
  s.email       = ["kelly.stannard@caspersleep.com"]
  s.summary     = "HI"
  s.description = "HI"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
