#!/usr/bin/env puma

directory '/home/deploy/wine-grape/current'
rackup "/home/deploy/wine-grape/current/config.ru"
environment 'production'

pidfile "/home/deploy/wine-grape/shared/tmp/pids/puma.pid"
state_path "/home/deploy/wine-grape/shared/tmp/pids/puma.state"
stdout_redirect '/home/deploy/wine-grape/current/log/puma.error.log', '/home/deploy/wine-grape/current/log/puma.access.log', true


threads 4,16

bind 'unix:///home/deploy/wine-grape/shared/tmp/sockets/wine-grape-puma.sock'

workers 0



preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/deploy/wine-grape/current/Gemfile"
end


on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

