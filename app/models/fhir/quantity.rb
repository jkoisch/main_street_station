module Fhir
  class Quantity
    attr_accessor :value, :comparator, :unit, :system, :code

    # noinspection RubyUnusedLocalVariable
    def initialize(attributes = {})
    end

    def self.parse_input(dtl)
      quantity = Quantity.new

      quantity.value = dtl[:value] unless dtl[:value].nil?
      quantity.comparator = dtl[:comparator] unless dtl[:comparator].nil?
      quantity.unit = dtl[:unit] unless dtl[:unit].nil?
      quantity.system = dtl[:system] unless dtl[:system].nil?
      quantity.code = dtl[:code] unless dtl[:code].nil?

      quantity
    end

  end
end