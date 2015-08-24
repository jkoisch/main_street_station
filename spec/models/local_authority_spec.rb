require 'rails_helper'

describe LocalAuthority do

  context 'Validations' do
    subject { LocalAuthority }

    it { should fail_with_null(:password) }
    it { should fail_with_null(:password_confirmation ) }
  end
end