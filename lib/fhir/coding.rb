module FHIR
  class Coding

    attr_accessor :code, :display, :system

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)
      new_coding = self.new()

      new_coding.code = json_dtl[:code] unless json_dtl[:code].nil?
      new_coding.display = json_dtl[:display] unless json_dtl[:display].nil?
      new_coding.system = json_dtl[:system] unless json_dtl[:system].nil?

      return new_coding
    end

  end
end