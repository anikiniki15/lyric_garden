source "https://rubygems.org"

gem "rails", "~> 8.1.1"
gem "tailwindcss-rails"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# 💡 pgをここに追加（PostgreSQL用）
gem "pg"

# 🔧 各種ライブラリ
gem "dockerfile-rails", ">= 1.7", group: :development
gem "devise"
gem "kaminari"
gem "ransack"
gem "rails-i18n"
gem "devise-i18n"
gem "devise-i18n-views"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "sqlite3", ">= 1.4"
end

group :development do
  gem "web-console"
end
