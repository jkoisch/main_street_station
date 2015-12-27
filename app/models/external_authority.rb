class ExternalAuthority < IdentityAuthority

  def self.create_for_oauth(auth, user)
    identity = find_by(uid: auth.uid, provider: auth.provider)
    Rails.logger.debug("--identity1: #{identity}")
    identity = ExternalAuthority.new(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    #identity = create(uid: auth.uid, provider: auth.provider, user_id: user.id) if identity.nil?
    if identity.save
      identity
    else
      Rails.logger.error '**FAILURE: failed to save ExternalAuthority'
      identity.errors.each do |error|
        Rails.logger.error error
      end
      nil
    end
  end
end