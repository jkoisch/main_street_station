module Fhir
  class Observations

    def initialize(attributes = {})
    end

    def self.init_from_ember(dtl)
      observations = []

      if dtl.count > 1
        dtl[:observation].each do |observation|
          observations << Observation.init_from_ember(observation)
        end
      else
        observations << Observation.init_from_ember(dtl[:observation])
      end

      observations
    end

  end
end