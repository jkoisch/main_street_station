module Fhir
  class Patient

    attr_accessor :id, :active, :address, :animal, :birthDate, :communication, :contact, :deceased,
                  :gender, :identifier, :links, :maritalStatus, :multipleBirth, :name, :provider,
                  :resource, :telecom, :text

    def initialize(accessors = {})
      accessors.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.init_from_ember(json_dtl)
      patient = self.new()

      patient.id = json_dtl[:id] unless json_dtl[:id].nil?
      patient.text = Text.parse_json_array(json_dtl[:text]) unless json_dtl[:text].nil?

      unless json_dtl[:identifier].nil? || json_dtl[:identifier].empty?
        patient.identifier = []
        json_dtl[:identifier].each {|identifier|
          patient.identifier << Identifiers.parse_json_array(identifier)
        }
      end

      unless json_dtl[:name].nil? || json_dtl[:name].empty?
        patient.name = []
        json_dtl[:name].each do |json_name|
          patient.name << HumanName.parse_json_array(json_name)
        end
      end

      unless json_dtl[:telecom].nil? || json_dtl[:telecom].empty?
        patient.telecom = []
        json_dtl[:telecom].each {|telecom|
          patient.telecom << TelecomContacts.parse_json_array(telecom)
        }
      end

      patient.gender = CodeableConcept.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?

      #unless json_dtl[:gender][:system].nil? && json_dtl[:gender][:code].nil? && json_dtl[:gender][:display].nil?
        #patient.gender = Gender.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
        #patient.gender = CodeableConcept.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
      #end

      patient.birthDate =  json_dtl[:birthDate][:value] unless json_dtl[:birthDate].nil?

      #todo <deceased[Boolean/DateTime] value=""/>
      #patient.deceased = json_dtl[:deceased] unless json_dtl[:deceased].nil?

      unless json_dtl[:address].nil? || json_dtl[:address].empty?
        patient.address = []
        json_dtl[:address].each {|addr|
          patient.address << Address.parse_json_array(addr)
        }
      end

      #if usage == 'Patient'
      patient.maritalStatus = CodeableConcept.parse_json_array(json_dtl[:maritalStatus]) unless json_dtl[:maritalStatus].nil?

      #json_dtl[:language].each do |communication|
      #  patient.communication = CodeableConcept.parse_json_array(communication)
      #end unless json_dtl[:language][:coding].empty?

      #todo <multipleBirth[Boolean/Integer] value=""/>
      #patient.multipleBirth = json_dtl[:multipleBirth] unless json_dtl[:multipleBirth].nil?

      unless json_dtl[:contact].nil?
        patient.contact = []
        json_dtl[:contact].each do |associate|
          patient.contact = Contacts.parse_json_array(associate)
        end
      end

      #todo communication from gringotts
      #unless json_dtl[:communication].nil? || json_dtl[:communication].empty?
      #  patient.communication = []
      #  json_dtl[:communication].each {|comm|
      #    patient.communication << CodeableConcept.parse_json_array(comm)
      #    }
      #end

      patient.provider = Resource.parse_json_array(json_dtl[:provider]) unless json_dtl[:provider].nil?

      unless json_dtl[:link].nil?
        patient.link = []
        json_dtl[:link].each {|link|
          patient.link = Resource.parse_json_array(link)
        }
      end

      patient.active = json_dtl[:active][:value] unless json_dtl[:active].nil?

      return patient
    end

    def self.search_patient(search_params)

      supported_params = [:name]

      if search_params[:id] == "search"
        conditions = {}
        search_params.slice(*supported_params).each do |scope, value|
        conditions[scope] = value
        end
      elsif search_params[:id] =~ /^(@\d{1,36}+$)/

      end

    end

  end
end



