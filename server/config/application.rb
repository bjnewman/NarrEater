require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NarrEatR
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    config.paperclip_defaults = {
    storage: :s3,
    s3_region: ENV["aws_s3_region"],
    s3_credentials: {
      s3_host_name: ENV["aws_s3_host_name"],
      bucket: ENV["aws_s3_bucket"],
      access_key_id: ENV["aws_access_key_ID"],
      secret_access_key: ENV["aws_secret_access_key"]
      }
    }

  end
end
