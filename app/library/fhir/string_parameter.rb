module Fhir
  class StringParameter
    def self.parse(field, value)
      search_field = field
      if field.include?(':')
        field_partitions = field.partition(':')
        unless field_partitions[2] =~ /exact/i
          search_field = ''
        end
      end
      {search_field => value}
    end
  end
end