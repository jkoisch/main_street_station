class SessionService
  # TODO Clean up to use the explicit password and not the entire params structure
  def self.authenticate(user, pw)
    if user && user.valid_password?(pw)
      unless user.user_tokens.current.count > 0
        UserToken.create!(user: user)
        if user.sign_in_count
          user.sign_in_count += 1
        else
          user.sign_in_count = 1
        end
        unless user.current_sign_in_at.nil?
          user.last_sign_in_at = user.current_sign_in_at
        end
        user.current_sign_in_at = Time.now
        user.save
      end
      true
    else
      false
    end
  end

  def self.cleanup(token)
    if ut = UserToken.find_by(authentication_token: token)
      user = ut.user
      user.user_tokens.destroy_all
    end
  end
end