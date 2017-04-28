# config valid only for current version of Capistrano
# lock "3.7.2"

set :application, "classic"
set :repo_url, "git@git.cbm-groupe.fr:mld/classic.git"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.1'

# in case you want to set ruby version from the file:
# set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc "Image symlink"
  task :create_symlink do
    on roles :all do
      execute "rm -rf /home/classic/staging/current/public/spree/products"
      execute "ln -nfs /home/classic/staging/shared/spree/products /home/classic/staging/current/public/spree/products"
    end
  end
end

after :deploy, "deploy:create_symlink"
after "deploy:restart", "deploy:cleanup"
