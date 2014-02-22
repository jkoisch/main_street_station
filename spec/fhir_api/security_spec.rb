require 'spec_helper'

describe 'Secure API' do

  describe 'Get /Observation' do
    before(:each) do
      # set the valid token
      # override the validate_authenticity_token method to use the valid_token below
    end

    let(:valid_token) { "abcdefg" }

    it 'should fail with an invalid token'

    it 'should pass with a valid token'
  end

end