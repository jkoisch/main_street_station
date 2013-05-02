require_relative 'period'

module FHIR
  class TelecomContacts

    attr_accessor :system, :value, :use, :period

    def initialize(attributes = {})
    end

    def self.parse_json_array(json_dtl)
      contact = self.new()

      contact.system = json_dtl[:system][:value] unless json_dtl[:system].nil?
      contact.value = json_dtl[:value][:value] unless json_dtl[:value].nil?
      contact.use = json_dtl[:use][:value] unless json_dtl[:use].nil?
      contact.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?

      contact
    end

  end
end