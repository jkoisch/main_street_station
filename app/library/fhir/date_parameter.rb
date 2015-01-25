module Fhir
  class DateParameter
    def self.parse(field, value)
      if value.start_with?('<=')
        {"#{field}_le" => value.delete('<=')}
      elsif value.start_with?('>=')
        {"#{field}_ge" => value.delete('>=')}
      elsif value.start_with?('<')
        {"#{field}_lt" => value.delete('<')}
      elsif value.start_with?('>')
        {"#{field}_gt" => value.delete('>')}
      else
        {field => value}
      end
    end

  end
end