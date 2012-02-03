source 'http://rubygems.org'

gem 'rails', '3.1.3'

group :assets do
  gem 'sass-rails',   '~> 3.0'
  gem 'coffee-rails', '~> 3.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'thin', '1.3.1'
gem 'redis', '2.2.2'
gem 'typhoeus', '0.3.3'

group :development, :test do
  gem 'rspec-rails', '2.7.0'
  gem 'capybara', '1.1.2'
  gem 'racksh'
  gem 'activemodel-rspec', :git => 'git://github.com/matthooks/activemodel-rspec.git'
end

group :development do
  gem 'foreman', '0.30.1'
  gem 'heroku', '2.17.0'
  gem 'unicorn', '4.1.1'
end

group :test do
  gem 'webmock', '1.7.8', :require => 'webmock/rspec'
end
