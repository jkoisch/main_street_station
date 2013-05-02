module FHIR
  class Text

    attr_accessor :status, :div

    def initialize(attributes = {})
    end

    def self.parse_json_array(json_dtl)
      txt = self.new()

      txt.status = json_dtl[:status] unless json_dtl[:status].nil?
      txt.div = json_dtl[:div] unless json_dtl[:div].nil?

      txt
    end

  end
end