module Fhir
  class Resource

    attr_accessor :type, :reference, :display, :resource, :id # :url,

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)
        resource = Resource.new()

        resource.type = json_dtl[:type] unless json_dtl[:type].nil?
        resource.reference = json_dtl[:reference] unless json_dtl[:reference].nil?
        resource.display = json_dtl[:display] unless json_dtl[:display].nil?
        #resource.url = json_dtl[:url] unless json_dtl[:url].nil?

        if json_dtl[:resource]

          resource_type = case json_dtl[:resource]
                          when 'client' then 'patient'
                          else json_dtl[:resource]
                        end

          resource.reference = resource_type + "/@" + json_dtl[:id].to_s
        end

        resource
    end

  end
end