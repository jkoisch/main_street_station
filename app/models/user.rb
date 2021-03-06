class User < ActiveRecord::Base
  has_many :user_tokens
  has_many :identity_authorities

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.create_from_form(form)
    User.new(email: form.email)
  end

  def self.from_omniauth(auth, signed_in_resource = nil)

    identity_auth = IdentityAuthority.find_for_oauth(auth)

    user = identity_auth.nil? ? find_user_by_email(auth) : find_user_by_oauth(identity_auth)
    user = create_user_by_oauth(auth) if user.nil?

    identity_auth = ExternalAuthority.create_for_oauth(auth, user) if identity_auth.nil?

    if identity_auth && identity_auth.user != user
      identity_auth.user = user
      identity_auth.save!
    end

    v = UserToken.create_authentication_token(user, auth.token)
    user

  end

  def self.find_user_by_oauth(identity_auth)
    find_by(id: identity_auth.user_id)
  end

  def self.create_user_by_oauth(auth)
    v = User.new(email: auth.info.email)
    v.save!
    v
  end

  def self.find_user_by_email(auth)
    find_by(email: auth.info.email)
  end

  def self.get_user_by_email(email)
    find_by(email: email)
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      Rails.logger.debug("TOKEN: ")
      Rails.logger.debug("#{params}")
      Rails.logger.debug("USER:")
      Rails.logger.debug("#{@user}")

      update_attributes(params, *options)
    else
      super
    end
  end

end
