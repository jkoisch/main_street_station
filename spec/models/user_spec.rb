require 'rails_helper'

describe User do

  context 'Validations' do
    subject {User}

    it { should fail_with_null(:email) }
  end
end