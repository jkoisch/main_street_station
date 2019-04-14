class ApiTokenStrategy < ::Warden::Strategies::Base
  include ActionController::HttpAuthentication::Token

  TOKEN_REGEX = /^Token /

  def valid?
    #puts "testing presence of mainstreet token"
    #puts auth_token_from_header

    auth_token_from_header.present?
  end

  def authenticate!
    failure_message = "Could not authenticate Mainstreet access"

    #puts "in mainstreet authenticate!"
    user_token = UserToken.find_by(authentication_token: auth_token_from_header[0])
    # Look at using the custom Warden response
    return fail!(failure_message) unless user_token && user_token.authentication_expiry > Time.now

    return success!(user_token.user)
  end

  def store?
    false
  end

  private

  def auth_token_from_header
    #env["HTTP_AUTHORIZATION"]

    authorization_request = env["HTTP_AUTHORIZATION"]
    if authorization_request && authorization_request[TOKEN_REGEX]
      params = token_params_from authorization_request
      [params.shift[1], Hash[params].with_indifferent_access]
    else
      nil
    end
  end

  def token_params_from(auth)
    rewrite_param_values params_array_from raw_params auth
  end

  # Takes raw_params and turns it into an array of parameters
  def params_array_from(raw_params)
    raw_params.map { |param| param.split %r/=(.+)?/ }
  end

  # This removes the <tt>"</tt> characters wrapping the value.
  def rewrite_param_values(array_params)
    array_params.each { |param| (param[1] || "").gsub! %r/^"|"$/, '' }
  end

  # This method takes an authorization body and splits up the key-value
  # pairs by the standardized <tt>:</tt>, <tt>;</tt>, or <tt>\t</tt>
  # delimiters defined in +AUTHN_PAIR_DELIMITERS+.
  def raw_params(auth)
    _raw_params = auth.sub(TOKEN_REGEX, '').split(/\s*#{AUTHN_PAIR_DELIMITERS}\s*/)

    if !(_raw_params.first =~ %r{\A#{TOKEN_KEY}})
      _raw_params[0] = "#{TOKEN_KEY}#{_raw_params.first}"
    end

    _raw_params
  end
end
