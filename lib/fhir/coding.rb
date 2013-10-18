module FHIR
  class Coding

    attr_accessor :code, :display, :system

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)
      coding = self.new()

      coding.code = json_dtl[:code] unless json_dtl[:code].nil?
      coding.display = json_dtl[:display] unless json_dtl[:display].nil?
      coding.system = json_dtl[:system] unless json_dtl[:system].nil?

      coding
    end

  end
end