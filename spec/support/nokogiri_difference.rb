module NokogiriDifference
  def list_differences(other,depth=0)
    diffs = []
    if other.nil?
      diffs << _add_indent(depth) + (self.document? ? 'document' : self.name) +
          ' has nil item to compare against'
    else
      if self.document?
        # unless self.namespace == other.namespace
        #   diffs << _add_indent(depth) + 'namespace <' +
        #       (self.namespace.nil? ? 'nil namespace' : self.namespace.href) + '> != <' +
        #       (other.namespace.nil? ? 'nil namespace' : other.namespace.href) + '>'
        # end
        diffs = self.first_element_child.list_differences(other.first_element_child)
      else
        unless EquivalentXml.equivalent?(self,other, element_order: true)
          unless self.name == other.name
            diffs << _add_indent(depth) + 'Expected <' + self.name + '> not <' + other.name + '>'
          end

          unless self.elements.count == other.elements.count
            diffs << _add_indent(depth) +
                "  - expected #{self.elements.count} sub-elements got #{other.elements.count}"
          end
          max_count = (self.elements.count > other.elements.count) ?
              self.elements.count : other.elements.count
          i = 0
          while i < max_count do
            if  i < self.elements.count && i < other.elements.count
            elsif i >= self.elements.count
              diffs << _add_indent(depth) + "  - unexpected element <#{other.elements[i].name}> found"
            elsif i >= other.elements.count
              diffs << _add_indent(depth) + "  - element <#{self.elements[i].name}> missing"
            end
            i += 1
          end
        end
      end
    end

    diffs
  end

  def _add_indent(depth)
    '                                                                                  '[0, depth * 3]
  end
end

class Nokogiri::XML::Node
  include NokogiriDifference
end
module TempTempTemp
def list_differences(other, output_array=[], indent='')
  (self.keys + other.keys).uniq.map do |item|
    if self.has_key?(item)
      if other.has_key?(item)
        current_item = self.fetch(item)
        unless current_item == other.fetch(item)
          if current_item.kind_of?(Array)
            other_item = other.fetch(item)
            if other_item.kind_of?(Array)
              if current_item.length == other_item.length
                output_array << indent + "Error within <<#{item}>>"
              else
                output_array << indent + "For item <<#{item}>> " +
                    "expected array of #{current_item.length} got an array of #{other_item.length} "
              end

              if current_item.length > 0 && other_item.length > 0
                current_item.each_index do |indx|
                  if indx < other_item.length
                    unless current_item[indx] == other_item[indx]
                      if current_item[indx].kind_of?(Hash)
                        output_array << '   ' + indent + "entry: #{indx} not equal"
                        current_item[indx].list_differences(other_item[indx], output_array,
                                                            '      ' + indent)
                      else
                        output_array << '   ' + indent + "entry: #{indx} -- expected '#{current_item[indx]}' got '#{other_item[indx]}'"
                      end
                    end
                  else
                    output_array << '   ' + indent + "entry #{indx} has no counterpart"
                  end
                end
              end
            else
              output_array << indent + "For item <<#{item}>> expected an Array got '#{other_item}'"
            end
          elsif current_item.kind_of?(Hash)
            output_array << indent + "Error within <<#{item}>>"
            if other.fetch(item).kind_of?(Hash)
              current_item.list_differences(other.fetch(item), output_array,
                                            indent + '+--')
            else
              output_array << indent + "   +-- Expected Hash but actual was '#{other.fetch(item)}'"
            end
          else
            output_array << indent + "For item <<#{item}>> expected '#{current_item}' got '#{other.fetch(item)}'"
          end
        end
      else
        output_array << indent + "Key --#{item}-- is missing"
      end
    else
      output_array << indent + "Found extra key ++#{item}++"
    end
  end
  output_array
end
end