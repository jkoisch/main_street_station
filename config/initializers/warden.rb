require 'api_token_strategy'

Warden::Manager.serialize_into_session do |manager|

end

Warden::Manager.serialize_from_session do |manager|

end

Warden::Strategies.add(:api_authentication_token, ApiTokenStrategy)


Rails.application.config.middleware.insert_before ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :api_authentication_token
  manager.failure_app = UnauthenticatedApiController

  manager.scope_defaults(:api,
                         :strategies => [:api_authentication_token],
                         :store      => false,
                         :action     => 'unauthenticated_api')
end
