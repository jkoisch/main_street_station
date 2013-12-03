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
      details.each do |key, value|
        send("ehmbr_#{key}=", value)
      end

    end

    def self.parse_ehmbr_list(details)
      list = []
      details.each do |detail|
        list << self.parse_ehmbr(detail)
      end
      list
    end

    def ehmbr_messaging=(detail)
      @messaging = Messaging.parse_ehmbr(detail)
    end

    def ehmbr_identifier(detail)
      @identifier = detail
    end

    def ehmbr_version(detail)
      @version = detail
    end
  end
end
