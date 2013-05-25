require_relative 'animal'
require_relative 'codeable_concept'
require_relative 'contacts'
require_relative 'details'
require_relative 'identifiers'
require_relative 'resource'
require_relative 'text'

module FHIR
  class Patient

    attr_accessor :id, :active, :animal, :contacts, :deceasedDate, :details, :diet, :identifiers, :links, :multipleBirth, :provider, :text

    def initialize(accessors = {})
      accessors.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.init_from_ember(json_dtl, source={})
      patient = self.new()

      #TODO: text and Narrative type - see resources - http://www.hl7.org/implement/standards/fhir/resources.htm#content

      json_dtl = case source
                  when 'fhir' then json_dtl[:Patient]
                  when 'gringotts' then json_dtl[:client]
                  else json_dtl
                 end

      patient.id = json_dtl[:id] unless json_dtl[:id].nil?
      patient.active = json_dtl[:active][:value] unless json_dtl[:active].nil?
      patient.animal = json_dtl[:animal] unless json_dtl[:animal].nil?

      unless json_dtl[:contact].nil?
        json_dtl[:contact].each do |associate|
          patient.contacts = Contacts.parse_json_array(associate)
        end
      end

      patient.deceasedDate = json_dtl[:deceasedDate] unless json_dtl[:deceasedDate].nil?
      patient.text = Text.parse_json_array(json_dtl[:text]) unless json_dtl[:text].nil?

      if json_dtl[:details].nil? && json_dtl[:name]
        patient.details = Details.parse_json_array(json_dtl)
      else
        patient.details = Details.parse_json_array(json_dtl[:details])
      end

      #patient.diet = CodeableConcept.parse_json_array(json_dtl[:diet]) unless json_dtl[:diet].nil?

      unless json_dtl[:identifier].nil? || json_dtl[:identifier].empty?
        patient.identifiers = []
        json_dtl[:identifier].each {|identifier|
          patient.identifiers << Identifiers.parse_json_array(identifier)
        }
      end

      unless json_dtl[:link].nil?
        patient.links = []
        json_dtl[:link].each {|link|
          patient.links = Resource.parse_json_array(link)
        }
      end

      #patient.multipleBirth = json_dtl[:multipleBirth] unless json_dtl[:multipleBirth].nil?
      patient.provider = Resource.parse_json_array(json_dtl[:provider]) unless json_dtl[:provider].nil?

      return patient
    end

    def self.search_patient(search_params)

      supported_params = [:name]

      if search_params[:id] == "search"
        conditions = {}
        search_params.slice(*supported_params).each do |scope, value|
        conditions[scope] = value
        end
      elsif search_params[:id] = "/^(@\d{1,36}+$)/"

      end

    end
  end
end

