module Fhir
  module AttributeDefs
    def fhir_attribute(attr_name, options={})
      attr_accessor(attr_name)
      add_attr_list(attr_name, options)
      if options.has_key?(:type)
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", options[:type].parse_ehmbr(content))
        end
      elsif options.has_key?(:list)
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", options[:list].parse_ehmbr_list(content))
        end
      elsif options.has_key?(:type_list)
        options[:type_list].each do |type|
          if type.simple_type?
            attr_accessor("#{attr_name}_#{type.output_type}")
          else
            raw_type = type.name.sub(/Fhir::Types::/, '')
            attr_accessor("#{attr_name}_#{raw_type.underscore}")
          end
        end

        define_method("ehmbr_#{attr_name}=") do |content|
          if content && content.has_key?('_type')
            klass = Fhir::Types.const_get(content['_type'])

            if klass.simple_type?
              send("#{attr_name}_#{klass.output_type}=", content['value'])
            else
              send("#{attr_name}_#{content['_type'].underscore}=", klass.parse_ehmbr(content))
            end
          end
        end
      elsif options.has_key?(:placeholder)
        # Do not define a parser
      else
        define_method("ehmbr_#{attr_name}=") do |content|
          send("#{attr_name}=", content)
        end
      end
    end

    def get_attr_details
      @attribute_details ||= superclass.methods.include?(:get_attr_details) ? {}.merge(superclass.get_attr_details) : {}
    end

    def get_attr_list
      @attribute_list ||= superclass.methods.include?(:get_attr_list) ? [].concat(superclass.get_attr_list) : []
    end

    def add_attr_list(new_attr, options)
      get_attr_list << new_attr
      if options.has_key?(:type)
        get_attr_details[new_attr] = {array: false, type: options[:type],
                                      include: options.has_key?(:include) ? options[:include] : :all}
      elsif options.has_key?(:list)
        get_attr_details[new_attr] = {array: true, type: options[:list],
                                      include: options.has_key?(:include) ? options[:include] : :all}
      elsif options.has_key?(:type_list)
        get_attr_details[new_attr] = {array: false, type: options[:type_list],
                                      include: options.has_key?(:include) ? options[:include] : :all}
      elsif options.has_key?(:array)
        get_attr_details[new_attr] = {array: true, type: :simple,
                                      include: options.has_key?(:include) ? options[:include] : :all}
      else
        get_attr_details[new_attr] = {array: false, type: :simple,
                                      include: options.has_key?(:include) ? options[:include] : :all}
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