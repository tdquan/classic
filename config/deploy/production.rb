role :app, %w{classic@188.166.36.67}
role :web, %w{classic@188.166.36.67}
role :db,  %w{classic@188.166.36.67}

set :application, "classic"
set :repo_url, "git@git.cbm-groupe.fr:mld/classic.git"

set :rails_env, :production
set :deploy_to, '/home/classic/pre-prod'

set :branch, 'master'

set :ssh_options, {
    forward_agent: true,
    keys: %w(~/.ssh/id_rsa),
    auth_methods: %w(password publickey),
    user: fetch(:user),
    password: 'classicpass'
  }

set :keep_releases, 5

namespace :deploy do

  desc "Image symlink"
  task :create_symlink do
    on roles :all do
      execute "rm -rf /home/classic/pre-prod/current/public/spree/products/*"
      execute "mkdir /home/classic/pre-prod/current/public/spree"
      execute "ln -nfs /home/classic/pre-prod/shared/spree/products /home/classic/pre-prod/current/public/spree/products"
      execute "ln -nfs /home/classic/pre-prod/shared/ckeditor_assets /home/classic/pre-prod/current/public/ckeditor_assets"

      execute"mv ~/pre-prod/current/public/assets/tinymce/langs/fr_FR.js ~/pre-prod/current/public/assets/tinymce/langs/fr.js"
    end
  end

  desc "Killing old processes and restarting unicorn"
  task :restart_unicorn do
    on roles :all do
      execute "ps -ef | grep classic | grep '[u]nicorn master' | awk '{print $2}' | xargs kill -9"
      within "~/pre-prod/current/" do
        execute "export SECRET_KEY_BASE=$(bundle exec rake secret)"
      end
    end
  end
end

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
