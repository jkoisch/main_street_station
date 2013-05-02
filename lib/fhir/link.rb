require_relative 'resource'

module FHIR
  class Link

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def parse_json_array(json_dtl)
      Resource.parse_json_array(json_dtl)
    end

  end
end