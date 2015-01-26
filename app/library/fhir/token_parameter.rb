module Fhir
  class TokenParameter
    def self.parse(field, value)
      search_field = field
      element_name = 'code'
      if field.include?(':')
        field_partitions = field.partition(':')
        search_field = field_partitions[0]
        if field_partitions[2] =~ /\Anot\Z/i
          element_name += ':ne'
        elsif field_partitions[2] =~ /\Atext\Z/i
          element_name = 'display'
        elsif field_partitions[2] =~ /\Ain\Z/i
          element_name = 'valueset'
        elsif field_partitions[2] =~ /\Anot-in\Z/i
          element_name = 'valueset:ne'
        end
      end

      if value.include?('|')
        partitions = value.partition('|')
        partitions[0] = nil if partitions[0].empty?
        {search_field => {'system' => partitions[0], element_name => partitions[2]}}
      else
        {search_field => {element_name => value}}
      end
    end
  end
end