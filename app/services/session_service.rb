class SessionService
  def self.authenticate(user, params)
    if user && user.valid_password?(params["password"])
      UserToken.create!(user: user)
      true
    else
      false
    end
  end
end