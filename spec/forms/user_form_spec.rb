require 'rails_helper'

describe UserForm do
  context 'validations' do
    #it {should validate_presence_of(:email)}
    #it {should validate_presence_of(:password) }
  end

  context '#save' do
    let(:form) { UserForm.new(email: 'test@test.com', password: 't3st',
                              password_confirmation: 't3st') }
    context 'with valid parameters' do
      it 'should return true' do
        expect(form.save).to eq true
      end

      it 'should store a User record' do
        expect {
          form.save
        }.to change(User, :count).by(1)
      end

      it 'should store an IdentityAuthority' do
        expect {
          form.save
        }.to change(IdentityAuthority, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      before(:each) { User.any_instance.stubs(:valid?).returns(false) }

      it 'should return false' do
        expect(form.save).to eq false
      end

      it 'should not store a User record' do
        expect {
          form.save
        }.to change(User, :count).by(0)
      end

      it 'should not store an IdentityAuthority' do
        expect {
          form.save
        }.to change(IdentityAuthority, :count).by(0)
      end

      it 'should report errors on the user record' do
        form.save
        form.user.errors.add(:email, 'fail')
        expect(form.errors).not_to be_empty
      end

      it 'should report errors on the identity authority' do
        form.save
        form.user.identity_authorities[0].errors.add(:password, 'failed')
        expect(form.errors).not_to be_empty
      end
    end
  end
end