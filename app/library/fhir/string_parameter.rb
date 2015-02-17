module Fhir
  class StringParameter
    def self.parse(field, value)
      search_field = field
      modifier = {}
      if field.include?(':')
        field_partitions = field.split(':')
        search_field = field_partitions[0]

        if field_partitions[1] =~ /exact/i
          modifier['modifier'] = 'ex'
        else
          raise Fhir::ParameterException, "Invalid modifier '#{field_partitions[1]}' for string parameter '#{search_field}'"
        end
      end
      {search_field =>  {'value' => value}.merge(modifier)}
    end
  end
end