MainStreetStation::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  #config.force_ssl = true

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.assets.quiet = true

  # Added for Devise when deploying to Heroku: forcing application to not access the DB
  # or load models when precompiling your assets.
  config.assets.initialize_on_precompile = false

  config.gringotts_url = 'http://localhost:9001/'

  config.fhir_enforce_security = true

  config.gringotts_conformance = Rails.root + 'config/conformance.json'

  #config.gringotts_url = 'http://protected-garden-4145.herokuapp.com/clients/'
 # config.ewout_url = 'http://spark.furore.com/fhir/observation?_format=json'  #patient?_format='
  #config.grahame_url = 'http://hl7connect.healthintersections.com.au/svc/fhir/observation?_format=json'  #patient?_format='
  #config.observation_home_url = Rails.root + '/FHIR-Patient_Files/gringott-observation.json'
  #config.deontik_url = 'http://eventswarm.whyanbeel.net:3333/fhir/observation'
end
