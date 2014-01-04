module Fhir
  class Conformance < BaseResource
#    attr_accessor :identifier, :version, :name, :publisher, :telecom, :description, :status,
#    :date, :fhir_version, :accept_unknown, :format, :profile, :messaging, :software, :rest,
#    :document, :implementation

    fhir_attribute :identifier
    fhir_attribute :version
    fhir_attribute :name
    fhir_attribute :publisher
    fhir_attribute :date
    fhir_attribute :fhir_version
    fhir_attribute :accept_unknown
    fhir_attribute :format
    fhir_attribute :rest, list: ConformanceClasses::Rest

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end


    #%w(identifier version name publisher telecom description status
    #    date fhir_version accept_unknown format profile software
    #    implementation).each do |attr|
    #  define_method("ehmbr_#{attr}=") do |detail|
    #    send("#{attr}=", detail)
    #  end
    #end
    #
    #def ehmbr_messaging=(detail)
    #  send("messaging=", Messaging.parse_ehmbr(detail))
    #end
    #
    #def ehmbr_rest=(detail)
    #  send("rest=", Rest.parse_ehmbr_list(detail))
    #end
  end
end
