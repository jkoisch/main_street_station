require_relative 'coding'

module FHIR
  class Gender

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)
      gender = self.new()
      gender = Coding.parse_json_array(json_dtl)
    end

  end
end