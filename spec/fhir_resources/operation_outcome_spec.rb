require 'spec_helper'

describe Fhir::OperationOutcome do
  context 'creation' do
    it 'should build from parameters' do
      expect(Fhir::OperationOutcome.build(severity: 'error', details: 'None')).to be_a(Fhir::OperationOutcome)
    end

    it 'should allow creation with multiple details'

    # 'Failing' does not mean throw and exception, it may only mean writing a message for someone to read
    it 'should fail with invalid severity'

    it 'should fail without severity'

    it 'should fail without details'
  end
end
