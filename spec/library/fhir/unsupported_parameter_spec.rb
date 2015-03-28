require 'spec_helper'

describe Fhir::UnsupportedParameter do
  context '.parse' do
    it 'should raise an exception when called' do
      expect {
        subject.class.parse('test:above', 'value')
      }.to raise_error(Fhir::ParameterException, "Unsupported parameter 'test'")
    end
  end
end