module FhirInterface
  class Observation
    attr_accessor :identifier, :status, :category, :code, :subject, :encounter, :effectiveDatetime, :effectivePeriod,
                  :issued, :performer, :valueQuantity, :valueCodeableConcept, :valueString, :valueRange, :valueRatio,
                  :valueSampledData, :valueAttachment, :valueTime, :valueDatetime, :valuePeriod, :dataAbsentReason,
                  :interpretation, :comment, :bodySite, :method, :specimen, :device
  end


  module ObservationClasses

    class ReferenceRange
      attr_accessor :low, :high, :meaning, :age
    end

    class Related
      attr_accessor :type, :target
    end

    class Component
      attr_accessor :code, :valueQuantity, :valueCodeableConcept, :valueString, :valueRange, :valueRatio,
                    :valueSampledData, :valueAttachment, :valueTime, :valueDatetime, :valuePeriod
                    :dataAbsentReason
    end
  end
end
