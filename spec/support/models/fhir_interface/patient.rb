module FhirInterface
  class Patient
    attr_accessor :identifier,:name,:telecom,:gender,:birthDate,:deceasedBoolean,:deceasedDateTime,
                  :address,:maritalStatus,:multipleBirthInteger,:multipleBirthBoolean,
                  :photo,:communication,:careProvider,:managingOrganization,:active
  end

  module PatientClasses
    class Animal
      attr_accessor :species,:breed,:genderStatus
    end

    class Link
      attr_accessor :other,:type
    end

    class Contact
      attr_accessor :relationship,:name,:telecom,:address,:gender,:organization
    end
  end
end
