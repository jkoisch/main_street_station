class IdentityAuthority < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    Rails.logger.debug("+++++++++ find_by uid: #{auth.uid}, provider #{auth.provider}")
    v = find_by(uid: auth.uid, provider: auth.provider)
    #first time through - user is nil
    #Rails.logger.debug("+++++++++ find_by user id:#{v.user_id}")
    v
    #find_or_create_by(uid: auth.uid, provider: auth.provider, last_used: DateTime.now)
  end

  def self.create_for_oauth(auth, user)
    identity = find_by(uid: auth.uid, provider: auth.provider)
    Rails.logger.debug("--identity1: #{identity}")
    #raise user
    identity = IdentityAuthority.new(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    #identity = create(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    identity.save
    Rails.logger.debug("---identity: #{identity}")
  end
end
