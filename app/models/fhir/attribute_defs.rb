module Fhir
  module AttributeDefs
    def fhir_attribute(attr_name, options={})
      attr_accessor(attr_name)
      if options.has_key?(:type)
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", options[:type].parse_ehmbr(content))
        end
      elsif options.has_key?(:list)
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", options[:list].parse_ehmbr_list(content))
        end
      else
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", content)
        end
      end
    end

    def parse_ehmbr(detail)
      obj = nil
      unless detail.nil?
        obj = self.new
        detail.each do |key, value|
          obj.send("ehmbr_#{key}=", value)
        end
      end
      obj
    end

    def parse_ehmbr_list(details)
      list = []
      unless details.nil?
        details.each do |detail|
          list << self.parse_ehmbr(detail)
        end
      end
      list
    end
  end
end