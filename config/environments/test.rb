MainStreetStation::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  config.autoload_paths += %W(#{config.root}/spec/support/models)
  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets = true
  config.static_cache_control = 'public, max-age=3600'

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  config.gringotts_url = 'http://gringotts.dev/'

  config.gringotts_client = Rails.root + 'spec/support-files/ehmbr/client.json'
  config.gringotts_condition = Rails.root + 'spec/support-files/ehmbr/condition.json'
  config.gringotts_conformance = Rails.root + 'config/conformance.json'
  config.gringotts_device = Rails.root + 'spec/support-files/ehmbr/device.json'
  config.gringotts_family_history = Rails.root + 'spec/support-files/ehmbr/family-history.json'
  config.gringotts_location = Rails.root + 'spec/support-files/ehmbr/location.json'
  config.gringotts_observation = Rails.root + 'spec/support-files/ehmbr/observation.json'
  config.gringotts_organization = Rails.root + 'spec/support-files/ehmbr/organization.json'
  config.gringotts_practitioner = Rails.root + 'spec/support-files/ehmbr/provider.json'
  config.gringotts_questionnaire = Rails.root + 'spec/support-files/ehmbr/questionnaire.json'

  config.fhir_enforce_security = false
end
