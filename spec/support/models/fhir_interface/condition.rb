module FhirInterface
  class Condition
    attr_accessor :identifier, :subject, :encounter, :asserter, :dateAsserted, :code, :category, :clinicalStatus, :certainty,
                  :severity, :onsetDate, :onsetAge, :abatementDate, :abatementAge, :abatementBoolean, :notes
  end

  module ConditionClasses
    class Stage
      attr_accessor :summary, :assessment
    end

    class Evidence
      attr_accessor :code, :detail
    end

    class Location
      attr_accessor :siteCodeableConcept, :siteReference
    end

    class RelatedItem
      attr_accessor :type, :code, :target
    end
  end
end
