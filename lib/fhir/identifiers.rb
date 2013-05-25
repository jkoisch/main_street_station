require_relative 'period'
require_relative 'resource'

module FHIR
  class Identifiers

    attr_accessor :id, :assigner, :label, :period, :system, :use

    def initialize(attributes={})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)
      new_identifier = Identifiers.new()

      new_identifier.id = json_dtl[:identifier][:value] unless json_dtl[:identifier].nil?
      new_identifier.assigner = Resource.parse_json_array(json_dtl[:assigner]) unless json_dtl[:assigner].nil?
      new_identifier.label = json_dtl[:label][:value] unless json_dtl[:label].nil?
      new_identifier.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?
      new_identifier.system = json_dtl[:system][:value] unless json_dtl[:system].nil?
      new_identifier.use = json_dtl[:use][:value] unless json_dtl[:use][:value].nil?

      new_identifier
    end

  end
end