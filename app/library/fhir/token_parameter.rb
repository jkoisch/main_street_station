module Fhir
  class TokenParameter
    def self.parse(field, value)
      search_field = field
      element_name = 'code'
      modifier = {}
      if field.include?(':')
        field_partitions = field.partition(':')
        search_field = field_partitions[0]
        if field_partitions[2] =~ /\Anot\Z/i
          modifier = {'modifier' => 'ne'}
        elsif field_partitions[2] =~ /\Atext\Z/i
          element_name = 'display'
        elsif field_partitions[2] =~ /\Ain\Z/i
          element_name = 'valueset'
        elsif field_partitions[2] =~ /\Anot-in\Z/i
          element_name = 'valueset'
          modifier = {'modifier' => 'ne'}
        elsif field_partitions[2] =~ /\Aabove|below\Z/i
          raise Fhir::ParameterException, "Unsupported modifier '#{field_partitions[2]}' for token parameter '#{search_field}'"
        else
          raise Fhir::ParameterException, "Invalid modifier '#{field_partitions[2]}' for token parameter '#{search_field}'"
        end
      end

      if value.include?('|')
        partitions = value.partition('|')
        partitions[0] = nil if partitions[0].empty?
        {search_field => {'system' => partitions[0], element_name => partitions[2]}.merge(modifier)}
      else
        {search_field => {element_name => value}.merge(modifier)}
      end
    end
  end
end