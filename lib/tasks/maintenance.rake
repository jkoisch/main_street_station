require 'highline/import'

namespace :db do
  namespace :load do
    task :admin_user => [:environment] do |t|
      email = ask('Please supply an email: ')
      pw = ask('enter password: ') { |q| q.echo = '@'}
      pw_confirm = ask('re-enter password (for confirmation) ') { |q| q.echo = '@' }
      User.create!(email: email, password: pw, password_confirmation: pw_confirm)
    end
  end
end