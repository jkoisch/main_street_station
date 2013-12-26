module Fhir
  class Conformance < Base
    attr_accessor :identifier, :version, :name, :publisher, :telecom, :description, :status,
    :date, :fhir_version, :accept_unknown, :format, :profile, :messaging, :software, :rest,
    :document, :implementation

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_ehmbr(detail)
      new_conformance = Conformance.new
      detail.each do |key, value|
        new_conformance.send("ehmbr_#{key}=", value)
      end
      new_conformance
    end

    def self.parse_ehmbr_list(details)
      list = []
      details.each do |detail|
        list << self.parse_ehmbr(detail)
      end
      list
    end

    %w(identifier version name publisher telecom description status
        date fhir_version accept_unknown format profile software
        implementation).each do |attr|
      define_method("ehmbr_#{attr}=") do |detail|
        send("#{attr}=", detail)
      end
    end

    def ehmbr_messaging=(detail)
      send("messaging=", Messaging.parse_ehmbr(detail))
    end

    def ehmbr_rest=(detail)
      send("rest=", Rest.parse_ehmbr_list(detail))
    end
  end
end
