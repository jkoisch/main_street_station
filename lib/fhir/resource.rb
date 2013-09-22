module FHIR
  class Resource

    attr_accessor :type, :reference, :display # :url,

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)
        new_resource = Resource.new()

        new_resource.type = json_dtl[:type] unless json_dtl[:type].nil?
        new_resource.reference = json_dtl[:reference] unless json_dtl[:reference].nil?
        new_resource.display = json_dtl[:display] unless json_dtl[:display].nil?
        #new_resource.url = json_dtl[:url] unless json_dtl[:url].nil?

        new_resource
    end

  end
end