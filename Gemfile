source 'http://rubygems.org'

gem 'rails', ">=3.1.0"
gem 'devise', '>=1.4.4'
gem 'rake', '>=0.9.2'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem 'sqlite3', '>=1.3.4'
  gem 'rspec-rails', '>=2.6.1'
  gem 'ruby-debug19', :require => 'ruby-debug'
  #gem 'foreigner', '>=1.1.1'
end

group :test do
  gem 'capybara', '>=1.1.0'           # :git => 'https://github.com/jnicklas/capybara.git', :ref => 'e73e77690ba4'
  gem 'factory_girl', '>=2.1.0'
  gem 'valid_attribute', '>=1.1.0'
  gem 'autotest-standalone', '>=4.5.6'
  gem 'autotest-fsevent', '>=0.2.5'
  gem "test_notifier", "~> 0.4.0", :require => "test_notifier/runner/rspec"
  gem 'spork', '0.9.0.rc5'
end
