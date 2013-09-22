module FHIR
  class Contacts
    attr_accessor :details, :organization, :relationships

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_input(detail)

    end
  end
end
