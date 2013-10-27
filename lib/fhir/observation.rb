require_relative 'codeable_concept'
require_relative 'component_observation'
require_relative 'identifiers'
require_relative 'reference_range'
require_relative 'resource'

module FHIR
  class Observation
    attr_accessor :name, :value, :interpretation, :comments, :applies, :issued, :status,
                  :reliability, :bodySite, :method, :identifier, :subject, :performer,
                  :referenceRange, :component

    def initialize(accessors = {})
      accessors.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.init_from_ember(dtl) #, source={})
      observation = self.new()

      #json_dtl = case source
      #             when 'gringotts' then dtl  #[:observation]
      #            else dtl
      #           end

      observation.name = CodeableConcept.parse_json_array(dtl[:name]) unless dtl[:name].nil?
      observation.value = dtl[:value] unless dtl[:value].nil?
      observation.interpretation = CodeableConcept.parse_json_array(dtl[:interpretation]) unless dtl[:interpretation].nil?
      observation.comments = dtl[:comments] unless dtl[:comments].nil?
      observation.applies = dtl[:applies][:value] unless dtl[:applies][:value].nil?
      observation.issued = dtl[:issued] unless dtl[:issued].nil?
      observation.status = dtl[:status] unless dtl[:status].nil?
      observation.reliability = dtl[:reliability] unless dtl[:reliability].nil?
      observation.bodySite = CodeableConcept.parse_json_array(dtl[:bodySite]) unless dtl[:bodySite].nil?
      observation.method = CodeableConcept.parse_json_array(dtl[:method]) unless dtl[:method].nil?
      observation.identifier = Identifiers.parse_json_array(dtl[:identifier]) unless dtl[:identifier].nil?
      observation.subject = Resource.parse_json_array(dtl[:subject]) unless dtl[:subject].nil?
      observation.performer = Resource.parse_json_array(dtl[:performer]) unless dtl[:performer].nil?

      #dtl[:referenceRange].each do |range|
      #  observation.referenceRange = ReferenceRange.parse_input(range)
      #end unless dtl[:referenceRange].nil?

      unless dtl[:component].nil?
        observation.component = []

        dtl[:component].each do |component|
          observation.component << Component_Observation.parse_input(component)
        end
      end

      observation
    end

  end
end