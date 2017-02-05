class UserForm
  include ActiveModel::Model

  attr_accessor :password, :password_confirmation
  attr_reader :user, :authority

  validates :email, presence: true

  delegate :name, :name=, :email, :email=, :sign_in_count, :sign_in_count=,
           :current_sign_in_at, :current_sign_in_at=, :last_sign_in_at, :last_sign_in_at=,
           :current_sign_in_ip, :current_sign_in_ip=, :created_at, :created_at=,
           :updated_at, :updated_at, :identity_authorities, :identity_authorities=,
           :active_for_authentication?, :inactive_message, :authenticatable_salt,
           to: :user, prefix: false, allow_nil: false
  #delegate :user_id, :user_id=, :authentication_token, :authentication_token=, :refresh_token,
  #         :refresh_token=, :authentication_expiry, :authentication_expiry=, :refresh_expiry,
  #         :refresh_expiry=, :created_at, :created_at=, :updated_at, :updated_at=,
  #         to: :user_token, prefix: false, allow_nil: false
  delegate :provider, :provider=, :uid, :uid=, :token_secret, :token_secret=,
           to: :authority, prefix: false, allow_nil: false

  def initialize(attrs={})
    @user = User.new()
    @authority = LocalAuthority.new(provider: 'youcentric', uid: UUID.generate())

    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    @user.identity_authorities << LocalAuthority.new(provider: 'youcentric',
                                                     uid: UUID.generate(), 
                                                     password: self.password, 
                                                     password_confirmation: self.password_confirmation)
    @user.save
  end

  def errors
    user.identity_authorities.each do |auth|
      auth.errors.each do |attr, msg|
        user.errors.add(attr, msg)
      end
    end
    user.errors
  end
end