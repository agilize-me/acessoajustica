require File.expand_path('../boot', __FILE__)

require 'devise'
require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    #TODO paliativo -> deveria adicionar has-error no control-group (parent)
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      "<div class=\"has-error\">#{html_tag}</div>".html_safe
    }

    config.middleware.use 'Apartment::Elevators::Subdomain'

  end

  # console do
  #   FactoryGirl.definition_file_paths << Pathname.new("spec/factories")
  #   FactoryGirl.definition_file_paths.uniq!
  #   FactoryGirl.find_definitions
  # end
end
