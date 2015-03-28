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
      if value.is_a?(Array)
        string_value = []
        value.each do |a_value|
          string_value << {'value' => a_value}.merge(modifier)
        end
      else
        string_value = {'value' => value}.merge(modifier)
      end
      {search_field =>  string_value}
    end
  end
end