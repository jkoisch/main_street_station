module Fhir
  class Text

    attr_accessor :status, :div

    def initialize(attributes = {})
    end

    def self.parse_json_array(json_dtl)
      text = self.new

      text.status = json_dtl[:status] unless json_dtl[:status].nil?
      text.div = json_dtl[:div] unless json_dtl[:div].nil?

      text
    end

  end
end