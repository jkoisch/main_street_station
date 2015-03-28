module Fhir
  class ReferenceParameter
    def self.parse(field, value)
      search_field = field
      modifier = {}
      if field.include?(':')
        field_partitions = field.partition(':')
        search_field = field_partitions[0]
        if field_partitions[2].include?('.')
          subject_partition = field_partitions[2].partition('.')
          modifier['resource'] = Fhir::Types::GringottConversion.to_gringott_type(subject_partition[0])
          modifier['field'] = subject_partition[2]
        else
          modifier['resource'] = Fhir::Types::GringottConversion.to_gringott_type(field_partitions[2])
        end
      elsif field.include?('.')
        field_partitions = field.partition('.')
        search_field = field_partitions[0]
        modifier['field'] = field_partitions[2]
      end

      if value.is_a?(Array)
        {search_field => nil}
      else
        {search_field => {'value' => value}.merge(modifier)}
      end
    end
  end
end