require 'spec_helper'

describe SessionService do
  let(:user) {User.create(email: 'temp@youcentric.com', password: '123temp', password_confirmation: '123temp')}

  it 'should authenticate a valid user' do
    params = {"password" => "123temp"}
    expect(SessionService.authenticate(user, params)).to be_true
  end

  it 'should reject an invalid user' do
    params = {"password" => "123temp"}
    expect(SessionService.authenticate(nil, params)).to be_false
  end

  it 'should reject an invalid password' do
    params = {"password" => "123tem"}
    expect(SessionService.authenticate(user, params)).to be_false
  end
end