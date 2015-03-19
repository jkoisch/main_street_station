module Fhir
  class DateParameter
    def self.parse(field, value)
      if value.is_a?(Array)
        values = []
        value.each do |the_value|
          values << format_value_clause(the_value)
        end
        {field => values}
      else
        {field => format_value_clause(value)}
      end
    end

    private
    def self.format_value_clause(value)
      if value.start_with?('<=')
        {'value' => value.delete('<='), 'modifier' => 'le'}
      elsif value.start_with?('>=')
        {'value' => value.delete('>='), 'modifier' => 'ge'}
      elsif value.start_with?('<')
        {'value' => value.delete('<'), 'modifier' => 'lt'}
      elsif value.start_with?('>')
        {'value' => value.delete('>'), 'modifier' => 'gt'}
      else
        {'value' => value}
      end
    end
  end
end