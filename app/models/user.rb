class User < ActiveRecord::Base
  devise :registerable, :omniauthable, :recoverable, :trackable,
         :rememberable, :omniauth_providers => [:facebook, :google]

  has_many :user_tokens
  has_many :identity_authorities

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.create_from_form(form)
    User.new(email: form.email)
  end

  def self.from_omniauth(auth, signed_in_resource = nil)

    identityAuth = IdentityAuthority.find_for_oauth(auth)

    #if identityAuth.nil?
    #  user = find_user_by_email(auth)
    #else
    #  user = find_user_by_oauth(identityAuth)
    #end

    user = identityAuth.nil? ? find_user_by_email(auth) : find_user_by_oauth(identityAuth)
    user = create_user_by_oauth(auth) if user.nil?

    identityAuth = IdentityAuthority.create_for_oauth(auth, user) if identityAuth.nil?
    #user = signed_in_resource ? signed_in_resource : identityAuth.user

    v = UserToken.create_authentication_token auth

    Rails.logger.debug("token created? #{v.nil?}")
    if identityAuth.user != user
      identityAuth.user = user
      identityAuth.save!
    end

    user

  end

  def self.find_user_by_oauth(identityAuth)
    find_by(id: identityAuth.user_id)
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
