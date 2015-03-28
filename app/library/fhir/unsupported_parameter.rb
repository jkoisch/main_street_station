module Fhir
  class UnsupportedParameter
    def self.parse(field, value)
      search_field = field
      if field.include?(':')
        field_partitions = field.partition(':')
        search_field = field_partitions[0]
      end

      raise Fhir::ParameterException, "Unsupported parameter '#{search_field}'"
    end
  end
end
