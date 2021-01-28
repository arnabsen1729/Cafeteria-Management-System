# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"
set :application, "cms"
set :repo_url, "git@github.com:arnabsen1729/Cafeteria-Management-System.git"

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads"

# Only keep the last 5 releases to save disk space
set :keep_releases, 5

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, "rails", "db:seed", "RAILS_ENV=production"
      end
    end
  end
end

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'
