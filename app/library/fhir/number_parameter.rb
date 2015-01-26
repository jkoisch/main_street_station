module Fhir
  class NumberParameter
    def self.parse(field, value)
      if value.start_with?('<=')
        {"#{field}:le" => value.delete('<=')}
      elsif value.start_with?('>=')
        {"#{field}:ge" => value.delete('>=')}
      elsif value.start_with?('<')
        {"#{field}:lt" => value.delete('<')}
      elsif value.start_with?('>')
        {"#{field}:gt" => value.delete('>')}
      elsif value.start_with?('!=')
        {"#{field}:ne" => value.delete('!=')}
      else
        {field => value}
      end
    end

  end
end