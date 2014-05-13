module Fhir
  class Narrative

    attr_accessor :div, :blob, :status

    def initialize(attributes = {})
    end

    def self.parse_json_array(json_dtl)
      narrative = Narrative.new

      narrative.div = json_dtl[:div] unless json_dtl[:div].nil?
      narrative.status = json_dtl[:status] unless json_dtl[:status].nil?

      unless json_dtl[:blob].nil?
        narrative.blob = []
        json_dtl[:blob].each {|blob|
          narrative.blob << Blob.parse_json_array(blob)
        }
      end

      narrative
    end

  end
end