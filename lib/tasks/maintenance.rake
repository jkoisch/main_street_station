require 'highline/import'

namespace :db do
  namespace :load do
    task :admin_user => [:environment] do |t|
      email = ask('Please supply an email: ')
      pw = ask('enter password: ') { |q| q.echo = '@'}
      pw_confirm = ask('re-enter password (for confirmation) ') { |q| q.echo = '@' }
      user = User.new(email: email)
      user.identity_authorities << LocalAuthority.new(provider: 'youcentric',
                                                      uid: UUID.generate(),
                                                      password: pw,
                                                      password_confirmation: pw_confirm)
      user.save!
    end
  end

  namespace :maintenance do
    task :cleanup => [:environment] do |t|
      UserToken.expired.destroy
    end
  end
end