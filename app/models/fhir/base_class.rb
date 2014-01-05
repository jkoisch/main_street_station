module Fhir
  class BaseClass
    extend AttributeDefs

    def initialize(attr_accessors={})
      update(attr_accessors)
    end

    def update(attr_values)
      attr_values.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end