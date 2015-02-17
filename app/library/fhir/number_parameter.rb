module Fhir
  class NumberParameter
    def self.parse(field, value)
      if value.start_with?('<=')
        {field => {'value' => value.delete('<='), 'modifier' => 'le'}}
      elsif value.start_with?('>=')
        {field => {'value' => value.delete('>='), 'modifier' => 'ge'}}
      elsif value.start_with?('<')
        {field => {'value' => value.delete('<'), 'modifier' => 'lt'}}
      elsif value.start_with?('>')
        {field => {'value' => value.delete('>'), 'modifier' => 'gt'}}
      elsif value.start_with?('!=')
        {field => {'value' => value.delete('!='), 'modifier' => 'ne'}}
      else
        {field => {'value' => value}}
      end
    end

  end
end