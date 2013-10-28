module Fhir
  class Blob

    attr_accessor :mimeType, :content

    def initialize(attributes = {})
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?

        blob = Blob.new()

        blob.mimeType = json_dtl[:mimeType] unless json_dtl[:mimeType].nil?
        blob.content = json_dtl[:content] unless json_dtl[:content].nil?

        blob
      end
    end

  end
end