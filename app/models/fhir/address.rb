module Fhir
  class Address

    attr_accessor :use, :text, :line, :city, :state, :zip, :country, :period

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

        address = self.new()

        address.use = json_dtl[:use] unless json_dtl[:use].nil?
        address.text = json_dtl[:text][:div] unless json_dtl[:text][:div].nil?

        unless json_dtl[:line].nil?
          address.line = []
          json_dtl[:line].each do |street|
            address.line = street
          end
        end

        address.city = json_dtl[:city] unless json_dtl[:city].nil?
        address.state = json_dtl[:state] unless json_dtl[:state].nil?
        address.zip = json_dtl[:zip] unless json_dtl[:zip].nil?
        address.country = json_dtl[:country] unless json_dtl[:country].nil?
        address.period = Period.parse_json_array(json_dtl[:period]) unless json_dtl[:period].nil?

        address
    end

  end
end