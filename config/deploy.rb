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
      execute "rm -rf /home/classic/staging/current/public/spree/products/*"
      execute "ln -nfs /home/classic/staging/shared/spree/products /home/classic/staging/current/public/spree/products"
    end
  end

  desc "Killing old processes and restarting unicorn"
  task :restart_unicorn do
    on roles :all do
      execute "ps -ef | grep classic | grep '[u]nicorn master' | awk '{print $2}' | xargs kill -9"
      within "~/staging/current/" do
        execute "export SECRET_KEY_BASE=$(rake secret)"
      end
      execute "/home/classic/.rbenv/shims/unicorn -c ~/staging/current/config/unicorn.rb -E production -D"
    end
  end
end

after :deploy, "deploy:create_symlink"
# after :deploy, "deploy:restart_unicorn"
after :deploy, "deploy:restart", "deploy:cleanup"
