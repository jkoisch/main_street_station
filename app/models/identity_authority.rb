require 'bcrypt'

class IdentityAuthority < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    Rails.logger.debug("+++++++++ find_by uid: #{auth.uid}, provider #{auth.provider}")
    v = find_by(uid: auth.uid, provider: auth.provider)
    v
    #find_or_create_by(uid: auth.uid, provider: auth.provider, last_used: DateTime.now)
  end
end