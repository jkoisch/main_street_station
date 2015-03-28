module Fhir
  class QuantityParameter
    def self.parse(field, value)
      if value.is_a?(Array)
        values_array = []
        value.each do |the_value|
          modifier = parse_modifier(the_value)
          value_hash = parse_value(the_value.gsub(/\A[<>!~]=?/, ''))
          raise Fhir::ParameterException,
                "Field: #{field} has invalid value <#{the_value}>" if value_hash.nil?
          values_array << value_hash.merge(modifier)
        end
        {field => values_array}
      else
        modifier = parse_modifier(value)
        value_hash = parse_value(value.gsub(/\A[<>!~]=?/, ''))
        raise Fhir::ParameterException,
              "Field: #{field} has invalid value <#{value}>" if value_hash.nil?
        {field => value_hash.merge(modifier) }
      end
    end

    private
    def self.parse_modifier(value)
      if value.start_with?('<=')
        {'modifier' => 'le'}
      elsif value.start_with?('>=')
        {'modifier' => 'ge'}
      elsif value.start_with?('<')
        {'modifier' => 'lt'}
      elsif value.start_with?('>')
        {'modifier' => 'gt'}
      elsif value.start_with?('!=')
        {'modifier' => 'ne'}
      elsif value.start_with?('~')
        {'modifier' => 'ap'}
      else
        {}
      end
    end

    def self.parse_value(value)
      if value.include?('|')
        value_params = value.split('|')
        if value_params[0].empty?
          nil
        elsif value_params.size < 3
          nil
        else
          return_hash = {'value' => value_params[0]}
          return_hash['code'] = value_params[2] unless value_params[2].empty?
          return_hash['system'] = value_params[1] unless value_params[1].empty? || value_params[2].empty?
          return_hash
        end
      else
        {'value' => value}
      end
    end
  end
end