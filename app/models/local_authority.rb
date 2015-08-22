class LocalAuthority < IdentityAuthority
  has_secure_password

  #before_save :encrypt_password
  #
  #validates_confirmation_of :password

  def self.create_for_new(user_form)
    LocalAuthority.new(uid: "93", provider: "youcentric",
                                  password: user_form.password,
                                  password_confirmation: user_form.password_confirmation)
  end

  #def encrypt_password
  #  Rails.logger.debug("---encrypt_password")
  #  if password.present?
  #    self.token_secret = BCrypt::Engine.generate_salt
  #    self.password = BCrypt::Engine.hash_secret(password, token_secret)
  #  end
  #end
end