source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'unicorn'

gem 'sqlite3', group: :development
gem 'pg', group: :production

gem 'redis'
gem 'redis-objects'

gem 'sidekiq'
gem 'sidetiq'
gem 'sidekiq-unique-jobs'

gem 'tumblr_client'

gem 'figaro'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
