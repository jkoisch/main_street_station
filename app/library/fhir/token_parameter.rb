module Fhir
  class TokenParameter
    def self.parse(field, value)
      if value.include?('|')
        partitions = value.partition('|')
        partitions[0] = nil if partitions[0].empty?
        {field => {'system' => partitions[0], 'code' => partitions[2]}}
      else
        {field => {'code' => value}}
      end
    end

  end
end