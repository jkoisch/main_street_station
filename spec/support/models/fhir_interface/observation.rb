module FhirInterface
  class Observation
    attr_accessor :code, :valueQuantity, :valueCodeableConcept, :valueAttachment, :valueRange, :valueRatio, :valuePeriod,
                  :valueSampledData, :valueString, :interpretation, :comments, :appliesDatetime, :appliesPeriod,
                  :issued, :status, :reliability, :bodySiteCodeableConcept, :bodySiteResourceReference, :method,
                  :identifier, :subject, :specimen, :performer, :device
  end

  module ObservationClasses
    class Related
      attr_accessor :type, :target
    end

    class ReferenceRange
      attr_accessor :low, :high, :meaning, :age
    end
  end
end
