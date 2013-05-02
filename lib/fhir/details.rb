require_relative 'address'
require_relative 'codeable_concept'
require_relative 'contacts'
require_relative 'gender'
require_relative 'human_name'
require_relative 'identifiers'
require_relative 'resource'
require_relative 'telecom_contacts'

module FHIR
  class Details

    attr_accessor  :identifiers, :addresses, :birthDate, :deceased, :gender,
                   :maritalStatus, :names, :photos, :telecoms

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl, usage = 'client')
        new_dtl = Details.new()

        if usage == 'Patient'
          unless json_dtl[:id].nil?
            new_dtl.identifiers = []
            json_dtl[:id].each {|id|
              new_dtl.identifiers << Identifiers.parse_json_array(id)
            }
          end

          new_dtl.deceased = json_dtl[:deceased] unless json_dtl[:deceased].nil?
          new_dtl.maritalStatus = CodeableConcept.parse_json_array(json_dtl[:maritalStatus]) unless json_dtl[:maritalStatus].nil?

          unless json_dtl[:photo].nil?
            new_dtl.photos = []
            json_dtl[:photo].each { |photo|
              new_dtl.photos << Resource.parse_json_array(photo)
            }
          end
        end

        unless json_dtl[:telecom].nil?
          new_dtl.telecoms = []
          json_dtl[:telecom].each {|telecom|
            new_dtl.telecoms << TelecomContacts.parse_json_array(telecom)
          }
        end

        unless json_dtl[:address].nil?
          new_dtl.addresses = []
          json_dtl[:address].each {|addr|
            new_dtl.addresses << Address.parse_json_array(addr)
          }
        end

        new_dtl.birthDate =  json_dtl[:birthDate] unless json_dtl[:birthDate].nil?

        unless json_dtl[:gender][:system].nil? && json_dtl[:gender][:code].nil? && json_dtl[:gender][:display].nil?
          new_dtl.gender = Gender.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
        end

        unless json_dtl[:name].nil?
          new_dtl.names = []
          json_dtl[:name].each {|json_name|
            new_dtl.names << HumanName.parse_json_array(json_name);
          }
        end

        new_dtl
      end
    end

  end