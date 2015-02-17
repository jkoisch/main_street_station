module Fhir
  class DateParameter
    def self.parse(field, value)
      if value.start_with?('<=')
        {field => {'value' => value.delete('<='), 'modifier' => 'le'}}
      elsif value.start_with?('>=')
        {field => {'value' => value.delete('>='), 'modifier' => 'ge'}}
      elsif value.start_with?('<')
        {field => {'value' => value.delete('<'), 'modifier' => 'lt'}}
      elsif value.start_with?('>')
        {field => {'value' => value.delete('>'), 'modifier' => 'gt'}}
      else
        {field => {'value' => value}}
      end
    end

  end
end