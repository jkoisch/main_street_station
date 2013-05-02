require_relative '../fhir/period'

module FHIR
  class Address

    attr_accessor :use, :text, :line, :city, :state, :zip, :country, :period

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

        new_addr = self.new()

        new_addr.use = json_dtl[:use] unless json_dtl[:use].nil?
        new_addr.text = json_dtl[:text][:div] unless json_dtl[:text][:div].nil?

        unless json_dtl[:line].nil?
          json_dtl[:line].each do |street|
            new_addr.line = street
          end
        end

        new_addr.city = json_dtl[:city] unless json_dtl[:city].nil?
        new_addr.state = json_dtl[:state] unless json_dtl[:state].nil?
        new_addr.zip = json_dtl[:zip] unless json_dtl[:zip].nil?
        new_addr.country = json_dtl[:country] unless json_dtl[:country].nil?
        new_addr.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?

        new_addr
    end

  end
end