# Puma configuration file for Rails application

# Specifies the number of threads to use
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the port to bind to
port        ENV.fetch("PORT") { 3000 }

# Specifies the environment
environment ENV.fetch("RAILS_ENV") { "production" }

# Specifies the number of worker processes to boot
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!

# Code to run before each worker boots
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

