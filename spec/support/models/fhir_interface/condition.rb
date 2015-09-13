module FhirInterface
  class Condition
    attr_accessor :identifier, :subject, :encounter, :asserter, :dateAsserted, :code, :category, :clinicalStatus,
                  :verificationStatus, :certainty, :severity, :onsetDate, :onsetAge, :abatementDatetime,
                  :abatementAge, :abatementBoolean, :notes
  end

  module ConditionClasses
    class Stage
      attr_accessor :summary, :assessment
    end

    class Evidence
      attr_accessor :code, :detail
    end
  end
end
