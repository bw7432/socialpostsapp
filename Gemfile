source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'devise_token_auth'
gem 'omniauth'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
gem 'rack-cors'
gem 'will_paginate', '~> 3.1.0'
gem "roo", "~> 2.7.0"
gem 'apipie-rails'
gem 'httparty'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot'
  gem 'guard-rspec', require: false
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
