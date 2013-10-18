require_relative 'period'

module FHIR
  class HumanName

    attr_accessor :family, :given, :period, :prefix, :suffix, :text, :use

    def initialize(accessors = {})
      accessors.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?

        human_Name = self.new()

        human_Name.text = json_dtl[:text][:value] unless json_dtl[:text].nil?
        human_Name.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?
        human_Name.use = json_dtl[:use][:value] unless json_dtl[:use].nil?

        unless json_dtl[:family].nil?
          human_Name.family = []
          json_dtl[:family].each { |family|
            human_Name.family << family
            }
        end

        unless json_dtl[:given].nil? || json_dtl[:given].empty?
          human_Name.given = []
          json_dtl[:given].each {|given|
            human_Name.given << given
            }
        end

        unless json_dtl[:prefix].nil?
          human_Name.prefix = []
          json_dtl[:prefix].each {|prefix|
            human_Name.prefix << prefix
          }
        end

        unless json_dtl[:suffix].nil?
          human_Name.suffix = []
          json_dtl[:suffix].each {|suffix|
            human_Name.suffix << suffix
          }
        end

      end

      human_Name
    end

  end
end