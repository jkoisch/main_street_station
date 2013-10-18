module FHIR
  class Resource

    attr_accessor :type, :reference, :display # :url,

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)
        resource = Resource.new()

        resource.type = json_dtl[:type] unless json_dtl[:type].nil?
        resource.reference = json_dtl[:reference] unless json_dtl[:reference].nil?
        resource.display = json_dtl[:display] unless json_dtl[:display].nil?
        #resource.url = json_dtl[:url] unless json_dtl[:url].nil?

        resource
    end

  end
end