module FHIR
  class Period

    attr_accessor :start, :end

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?
        new_period = self.new()

        new_period.start = json_dtl[:start] unless json_dtl[:start].nil?
        new_period.end = json_dtl[:end] unless json_dtl[:end].nil?

        new_period
      end
    end

  end
end