module Fhir
  class BaseResource
    extend AttributeDefs

    fhir_attribute :id
    fhir_attribute :text
    fhir_attribute :extension

    def initialize(attr_accessors={})
      update(attr_accessors)
    end

    def update(attr_values)
      attr_values.each do |name, value|
        send("#{name}=", value)
      end
    end

    def to_partial_path
      self.class.name.split('::').last.underscore
    end

    # noinspection RubyUnusedLocalVariable
    def ehmbr_resource_type=(content)
      # Just eat the contents, might wish to validate in future
    end
  end
end
