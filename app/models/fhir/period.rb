module Fhir
  class Period

    attr_accessor :start, :end

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?
        period = self.new()

        period.start = json_dtl[:start] unless json_dtl[:start].nil?
        period.end = json_dtl[:end] unless json_dtl[:end].nil?

        period
      end
    end

  end
end