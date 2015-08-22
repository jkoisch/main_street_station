class ExternalAuthority < IdentityAuthority

  def self.create_for_oauth(auth, user)
    identity = find_by(uid: auth.uid, provider: auth.provider)
    Rails.logger.debug("--identity1: #{identity}")
    identity = ExternalAuthority.new(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    #identity = create(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    identity.save
    Rails.logger.debug("---identity: #{identity.uid} #{identity.type}")
  end
end