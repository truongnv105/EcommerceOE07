source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "~> 3.1.11"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.3.7"
gem "carrierwave", "1.2.2"
gem "cocoon"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "~> 1.7.3"
gem "font-awesome-rails"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-slick-rails"
gem "kaminari"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.0"
gem "rails", "~> 5.1.6"
gem "rubocop", "~> 0.5.0", require: false
gem "sass-rails", "~> 5.0"
gem "sweetalert2"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "sqlite3"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
