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
      execute "mkdir /home/classic/staging/current/public/spree"
      execute "ln -nfs /home/classic/staging/shared/spree/products /home/classic/staging/current/public/spree/products"
      execute "mkdir /home/classic/staging/current/public/spree/ckeditor_assets"
      execute "ln -nfs /home/classic/staging/shared/spree/ckeditor_assets/pictures /home/classic/staging/current/public/spree/ckeditor_assets/pictures"

      execute"mv ~/staging/current/public/assets/tinymce/langs/fr_FR.js ~/staging/current/public/assets/tinymce/langs/fr.js"
    end
  end

  desc "Killing old processes and restarting unicorn"
  task :restart_unicorn do
    on roles :all do
      execute "ps -ef | grep classic | grep '[u]nicorn master' | awk '{print $2}' | xargs kill -9"
      within "~/staging/current/" do
        execute "export SECRET_KEY_BASE=$(bundle exec rake secret)"
      end
      execute "bundle exec unicorn -c config/unicorn/staging.rb -E production -D"
    end
  end
end

after :deploy, "deploy:create_symlink"
after :deploy, "deploy:restart_unicorn"
after "deploy:restart", "deploy:cleanup"
