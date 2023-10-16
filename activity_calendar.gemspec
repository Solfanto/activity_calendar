$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "activity_calendar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "activity_calendar"
  spec.version     = ActivityCalendar::VERSION
  spec.authors     = ["Matthew Nguyen"]
  spec.email       = ["contact@n-studio.fr"]
  spec.homepage    = "https://github.com/Solfanto/activity_calendar"
  spec.summary     = "Github-inspired activity calendar."
  spec.description = "Github-inspired activity calendar."
  spec.license     = "MIT"

  spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0.2.2"

  spec.add_development_dependency "memoist"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "puma"
end
