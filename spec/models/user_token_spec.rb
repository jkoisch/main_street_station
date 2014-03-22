require 'spec_helper'

describe 'UserToken' do

  it 'should do generate a new instance'

  it 'should find by authentication token'

  it 'should find by refresh token'

  describe 'instance' do
    it 'should generate a new authentication when still able to refresh'

    it 'should be invalid if past the expiry date'

    it 'should ??throw an error?? when asked to generate a new authentication token and cannot refresh'
  end

end