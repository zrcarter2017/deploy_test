# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "deploy_test"
set :repo_url, "https://github.com/taylorturneriv/deploy_test.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/deploy_test"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

append :linked_files, "config/database.yml", "config/secrets.yml", "scripts/distribution.py", "scripts/dist_schedule.py", "scripts/run_once.py", "scripts/print_data.py"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
