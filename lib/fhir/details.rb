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
        detail = Details.new()

          unless json_dtl[:identifier].nil? || json_dtl[:identifier].empty?
            detail.identifiers = []
            json_dtl[:identifier].each {|id|
              detail.identifiers << Identifiers.parse_json_array(id)
            }
          end

        detail.deceased = json_dtl[:deceased] unless json_dtl[:deceased].nil?

        if usage == 'Patient'
          detail.maritalStatus = CodeableConcept.parse_json_array(json_dtl[:maritalStatus]) unless json_dtl[:maritalStatus].nil?
=begin
          unless json_dtl[:photo].nil?
            detail.photos = []
            json_dtl[:photo].each { |photo|
              detail.photos << Resource.parse_json_array(photo)
            }
          end
=end
        end

        unless json_dtl[:telecom].nil? || json_dtl[:telecom].empty?
          detail.telecoms = []
          json_dtl[:telecom].each {|telecom|
            detail.telecoms << TelecomContacts.parse_json_array(telecom)
          }
        end

        unless json_dtl[:address].nil? || json_dtl[:address].empty?
          detail.addresses = []
          json_dtl[:address].each {|addr|
            detail.addresses << Address.parse_json_array(addr)
          }
        end

        detail.birthDate =  json_dtl[:birthDate] unless json_dtl[:birthDate].nil?

        unless json_dtl[:gender][:system].nil? && json_dtl[:gender][:code].nil? && json_dtl[:gender][:display].nil?
          detail.gender = Gender.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
        end

        unless json_dtl[:name].nil? || json_dtl[:name].empty?
          detail.names = []
          json_dtl[:name].each {|json_name|
            detail.names << HumanName.parse_json_array(json_name);
          }
        end

        detail
    end

    def fhir_text(field, options={})
      unless json_dtl[field].nil? || json_dtl[field].empty?
        json_dtl[field]
      end


    end
  end

end