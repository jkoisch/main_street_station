require_relative 'observation'

module FHIR
  class Observations

    def initialize(attributes = {})
    end

    def self.init_from_ember(dtl)
      observations = []

      dtl[:observations].each do |observation|
        observations << Observation.parse_input(observation)
      end

      observations
    end

  end
end