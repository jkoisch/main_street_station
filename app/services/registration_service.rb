class RegistrationService

  def self.add_plain_user(user_form)
    user_form.identity_authorities << LocalAuthority.create_for_new(user_form)
    user.save
  end

end