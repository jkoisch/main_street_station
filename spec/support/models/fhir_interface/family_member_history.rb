module FhirInterface
  class FamilyMemberHistory
    attr_accessor :identifier, :subject, :note
  end

  module FamilyMemberHistoryClasses
    class Relation
      attr_accessor :name, :relationship, :bornPeriod, :bornDate, :bornString, :deceasedBoolean, :deceasedAge,
                    :deceasedRange, :deceasedDate, :deceasedString, :note
    end

    class Condition
      attr_accessor :type, :outcome, :onsetAge, :onsetRange, :onsetString, :note
    end
  end
end
