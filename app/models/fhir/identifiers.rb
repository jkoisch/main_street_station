module Fhir
  class Identifiers

    attr_accessor :key, :assigner, :label, :period, :system, :use

    def initialize(attributes={})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)
      identifier = Identifiers.new()

      identifier.key = json_dtl[:identifier][:value] unless json_dtl[:identifier].nil?
      identifier.assigner = Resource.parse_json_array(json_dtl[:assigner]) unless json_dtl[:assigner].nil?
      identifier.label = json_dtl[:label][:value] unless json_dtl[:label].nil?
      identifier.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?
      identifier.system = json_dtl[:system][:value] unless json_dtl[:system].nil?
      identifier.use = json_dtl[:use][:value] unless json_dtl[:use][:value].nil?

      identifier
    end

  end
end