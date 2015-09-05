require 'bcrypt'

class IdentityAuthority < ActiveRecord::Base
  PROVIDERS = {local: 'youcentric', google: 'google', facebook: 'facebook'}
  belongs_to :user

  scope :local, -> { where(provider: PROVIDERS[:local]) }

  validates :user, presence: true
  validates :uid, uniqueness: {scope: :provider}

  def self.find_for_oauth(auth)
    Rails.logger.debug("+++++++++ find_by uid: #{auth.uid}, provider #{auth.provider}")
    v = find_by(uid: auth.uid, provider: auth.provider)
    v
  end

end