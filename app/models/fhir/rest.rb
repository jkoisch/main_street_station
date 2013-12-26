module Fhir
  class Rest < Base
    attr_accessor :mode, :resource

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_ehmbr(detail)
      obj = self.new
      detail.each do |key, value|
        obj.send("ehmbr_#{key}=", value)
      end
      obj
    end

    def self.parse_ehmbr_list(details)
      list = []
      details.each do |detail|
        list << self.parse_ehmbr(detail)
      end
      list
    end

    %w(mode).each do |attr|
      define_method("ehmbr_#{attr}=") do |detail|
        send("#{attr}=", detail)
      end
    end

    def ehmbr_resource=(detail)
      send("resource=", Resource.parse_ehmbr_list(detail))
    end

  end
end