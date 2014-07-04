#require File.join(File.dirname(__FILE__), 'fhir_interface/types.rb')
#require File.join(File.dirname(__FILE__), 'fhir_interface/patient.rb')
Dir[File.join(File.dirname(__FILE__), 'fhir_interface/**/*.rb')].each { |f| require f }

module FhirInterface

end