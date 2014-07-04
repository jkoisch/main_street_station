module FhirInterface
  class Observation
    attr_accessor :name, :valueQuantity, :valueCodeableConcept, :valueAttachment, :valueRatio, :valuePeriod,
                  :valueSampledData, :valueString, :interpretation, :comments, :appliesDatetime, :appliesPeriod,
                  :issued, :status, :reliability, :bodySite, :method, :identifier, :subject, :specimen, :performer
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
