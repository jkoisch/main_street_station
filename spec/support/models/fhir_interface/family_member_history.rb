module FhirInterface
  class FamilyMemberHistory
    attr_accessor :identifier, :subject, :name, :relationship, :gender, :bornPeriod, :bornDate, :bornString,
                  :ageAge, :ageRange, :ageString,
                  :deceasedBoolean, :deceasedAge, :deceasedRange, :deceasedDate, :deceasedString, :note
  end

  module FamilyMemberHistoryClasses
    class Condition
      attr_accessor :type, :outcome, :onsetAge, :onsetRange, :onsetString, :note
    end
  end
end
