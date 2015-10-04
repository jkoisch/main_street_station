module NokogiriDifference
  def list_differences(other,depth=0,debug=false)
    diffs = []
    if other.nil?
      diffs << _add_indent(depth) + (self.document? ? 'document' : self.name) +
          ' has nil item to compare against'
    else
      if self.document?
        diffs = self.first_element_child.list_differences(other.first_element_child,depth,debug)
      else
        unless EquivalentXml.equivalent?(self, other, opts: {element_order: true, normalize_whitespace: true})
          diffs << _add_indent(depth) + "Error in <#{self.name}>"

          if self.namespace && other.namespace.nil?
            diffs << _add_indent(depth) + 'namespace <' + self.namespace.href + '> not found'
          elsif other.namespace && self.namespace.nil?
            diffs << _add_indent(depth) + 'found namespace <' + other.namespace.href + '> not expected'
          else
            unless self.namespace.href == other.namespace.href
              diffs << _add_indent(depth) + 'namespace <' +
                  (self.namespace.nil? ? 'nil namespace' : self.namespace.href) + '> != <' +
                  (other.namespace.nil? ? 'nil namespace' : other.namespace.href) + '>'
            end
          end

          if self.elements.count == 0 && debug
            diffs << _add_indent(depth) + ' - expected: ' + self.to_s
            diffs << _add_indent(depth) + ' - received: ' + other.to_s
          end

          unless self.name == other.name
            diffs << _add_indent(depth) + ' - expected element <' + self.name + '> not <' + other.name + '>'
          end

          unless self.attributes.count == other.attributes.count
            diffs << _add_indent(depth) +
                " - expected #{self.attributes.count} attributes got #{other.attributes.count}"
          end

          attributes = self.keys
          other_attributes = other.keys

          attributes.each do |attribute|
            if other_attributes.include?(attribute)
              unless self[attribute] == other[attribute]
                diffs << _add_indent(depth) + " - @#{attribute} expected: #{self[attribute]} " +
                    "got: #{other[attribute]}"
              end
            else
              diffs << _add_indent(depth) + " - @#{attribute} attribute is missing"
            end
          end

          (other_attributes - attributes).each do |attr|
            diffs << _add_indent(depth) + " - @#{attr} attribute is extra"
          end

          unless self.elements.count == other.elements.count
            diffs << _add_indent(depth) +
                " - expected #{self.elements.count} sub-elements got #{other.elements.count}"
          end
          max_count = (self.elements.count > other.elements.count) ?
              self.elements.count : other.elements.count
          i = 0
          while i < max_count do
            if  i < self.elements.count && i < other.elements.count
              diffs.concat(self.elements[i].list_differences(other.elements[i], depth + 1,debug))
            elsif i >= self.elements.count
              diffs << _add_indent(depth) + " - unexpected element <#{other.elements[i].name}> found"
            elsif i >= other.elements.count
              diffs << _add_indent(depth) + " - element <#{self.elements[i].name}> missing"
            end
            i += 1
          end
        end
      end
    end

    diffs
  end

  def smooth!(filter_list={})
    filter_list.each_pair do |key, value|
      self.xpath(key).each do |filtered_item|
        filtered_item.value = value
      end
    end
  end

  def _add_indent(depth)
    '                                                                                  '[0, depth * 3]
  end
end

class Nokogiri::XML::Node
  include NokogiriDifference
end
