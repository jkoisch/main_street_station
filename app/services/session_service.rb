class SessionService
  def self.authenticate(user, params)
    if user
      true
    else
      false
    end
  end
end