source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.2'
gem 'pg'
gem 'unicorn'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'redis'

gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form'
gem 'autoprefixer-rails'

gem 'coffee-rails', '~> 4.2'

gem 'spree', '~> 3.2.1'
gem 'spree_auth_devise', '~> 3.2.0.beta'
gem 'spree_gateway', '~> 3.2.0.beta'

gem 'kaminari'

## text editor
gem 'spree_editor', github: 'spree-contrib/spree_editor'

# Translation
gem 'spree_i18n', github: 'spree-contrib/spree_i18n', branch: 'master'
# gem 'globalize', github: 'globalize/globalize', branch: 'master'
gem 'spree_address_book', github: 'spree-contrib/spree_address_book'
#gem 'activemodel-serializers-xml'
#gem 'spree_globalize', github: 'spree-contrib/spree_globalize', branch: 'master'


group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'

  gem 'puma'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'capistrano-secrets-yml', '~> 1.0.0'
end

group :production do
  # capistrano
  gem "capistrano", "3.7.2"
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-unicorn',   require: false
end


