# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
#require 'shoulda/matchers'
require 'webmock/rspec'
require 'shoulda/matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

FactoryBot.definition_file_paths = %w(spec/support-files/factories)
FactoryBot.find_definitions

RSpec.configure do |config|
  # noinspection RubyResolve
  config.run_all_when_everything_filtered                = true
  config.filter_run_including focus: true

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # noinspection RubyResolve
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  # noinspection RubyResolve
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include Requests::JsonHelpers, type: :request
  config.include Requests::JsonHelpers, type: :view
  config.include Requests::XmlHelpers, type: :request
  config.include Requests::XmlHelpers, type: :view
  config.include Fhir::Spec::Helpers
  config.include Warden::Test::ControllerHelpers, type: :controller
end

#WebMock.stub_request(:any, 'http://gringotts.dev/')

FactoryBot.register_strategy(:json, JsonStrategy)