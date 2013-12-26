module Fhir
  class Messaging < Base
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
  end
end