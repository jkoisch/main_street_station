class UserToken < ActiveRecord::Base
  belongs_to :user

  before_validation :generate_auth_token, on: :create
  before_validation :generate_refresh_token, on: :create
  before_validation :set_auth_expiry, on: :create
  before_validation :set_refresh_expiry, on: :create

  validates :user, presence: true
  validates :authentication_token, presence: true
  validates :refresh_token, presence: true
  validates :authentication_expiry, presence: true
  validates :refresh_expiry, presence: true
  validates :authentication_token, uniqueness: true
  validates :refresh_token, uniqueness: true

  scope :by_refresh_token, ->(token) { where(refresh_token: token) }
  scope :current, ->(now=Time.now) { where('refresh_expiry > ? and authentication_expiry > ?', now, now) }
  scope :expired, ->(now=Time.now) { where('refresh_expiry < ? and authentication_expiry < ?', now, now) }

  def self.is_valid_auth_token(token)
    exists?(['authentication_token = ? and authentication_expiry > ?', token, Time.now])
  end

  def self.is_valid_refresh_token(token)
    exists?(['refresh_token = ? and refresh_expiry > ?', token, Time.now])
  end

  def self.create_authentication_token(user, token)
    create(user: user,
           authentication_token: token)
  end

  def authentication_active?
    self.refreshable? and self.authentication_expiry > Time.now
  end

  def refreshable?
    self.refresh_expiry > Time.now
  end

  def refresh_authentication
    raise 'Cannot refresh authentication after refresh limit expired' unless self.refreshable?
    generate_auth_token
    set_auth_expiry
    self
  end

  def authentication_time_limit
    Time.now + 4.hours
  end

  def refresh_time_limit
    Time.now + 24.hours
  end

  private

  def generate_auth_token
    self.authentication_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserToken.exists?(authentication_token: random_token)
    end
  end

  def generate_refresh_token
    self.refresh_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserToken.exists?(refresh_token: random_token)
    end
  end

  def set_auth_expiry
    self.authentication_expiry = if self.refresh_expiry
                                   if (self.authentication_time_limit) > self.refresh_expiry
                                     self.refresh_expiry
                                   else
                                     self.authentication_time_limit
                                   end
                                 else
                                   self.authentication_time_limit
                                 end
  end

  def set_refresh_expiry
    self.refresh_expiry = self.refresh_time_limit
  end

end