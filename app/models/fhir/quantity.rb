module Fhir
  class Quantity
    attr_accessor :value, :comparator, :units, :system, :code

    def initialize(attributes = {})
    end

    def self.parse_input(dtl)
      quantity = Quantity.new()

      quantity.value = dtl[:value] unless dtl[:value].nil?
      quantity.comparator = dtl[:comparator] unless dtl[:comparator].nil?
      quantity.units = dtl[:units] unless dtl[:units].nil?
      quantity.system = dtl[:system] unless dtl[:system].nil?
      quantity.code = dtl[:code] unless dtl[:code].nil?

      quantity
    end

  end
end