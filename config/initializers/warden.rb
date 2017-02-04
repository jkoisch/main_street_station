require 'api_token_strategy'

Warden::Strategies.add(:api_authentication_token, ApiTokenStrategy)

Rails.application.config.middleware.insert_after ActionDispatch::ParamsParser, Warden::Manager do |manager|
  manager.default_strategies :api_authentication_token
  manager.failure_app = UnauthenticatedApiController
end
