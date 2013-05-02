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

        new_name = self.new()

        new_name.text = json_dtl[:text][:value] unless json_dtl[:text][:value].nil?
        new_name.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?
        new_name.use = json_dtl[:use] unless json_dtl[:use].nil?

        unless json_dtl[:family].nil?
          new_name.family = []
          json_dtl[:family].each { |family|
            new_name.family << family
            }
        end

        unless json_dtl[:given].nil?
          new_name.given = []
          json_dtl[:given].each {|given|
            new_name.given << given
            }
        end

        unless json_dtl[:prefix].nil?
          new_name.prefix = []
          json_dtl[:prefix].each {|prefix|
            new_name.prefix << prefix
          }
        end

        unless json_dtl[:suffix].nil?
          new_name.suffix = []
          json_dtl[:suffix].each {|suffix|
            new_name.suffix << suffix
          }
        end

      end

      new_name
    end

  end
end