module FhirInterface
  class FamilyHistory
    attr_accessor :identifier, :subject, :note
  end

  module FamilyHistoryClasses
    class Relation
      attr_accessor :name, :relationship, :bornPeriod, :bornDate, :bornString, :deceasedBoolean, :deceasedAge,
                    :deceasedRange, :deceasedDate, :deceasedString, :note
    end

    class Condition
      attr_accessor :type, :outcome, :onsetAge, :onsetRange, :onsetString, :note
    end
  end
end
