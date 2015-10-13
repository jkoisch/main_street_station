class Hash
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

  def smooth!(filter_list = {})
    filter_list.each_pair do |smooth_item, smoothing_value|
      if smooth_item.count('/') > 0
        (prefix, splitter, remain) = smooth_item.partition('/')

        if prefix == '*'
          puts "May still remove this (#{remain})"
        elsif prefix == '**'
          if self.has_key?(remain)
            self.store(remain, smoothing_value)
          end

          each_value do |current_item|
            if current_item.kind_of?(Hash)
              current_item.smooth!({smooth_item => smoothing_value})
            elsif current_item.kind_of?(Array)
              current_item.each do |thing|
                if thing.kind_of?(Hash)
                  thing.smooth!({smooth_item => smoothing_value})
                end
              end
            end
          end
        else
          if self.has_key?(prefix)
            current_item = self.fetch(prefix)
            if current_item.kind_of?(Hash)
              current_item.smooth!({smooth_item => smoothing_value})
            elsif current_item.kind_of?(Array)
              current_item.each do |thing|
                if thing.kind_of?(Hash)
                  thing.smooth!({smooth_item => smoothing_value})
                end
              end
            end
          end
        end
      elsif self.has_key?(smooth_item)
        self.store(smooth_item, smoothing_value)
      end
    end
  end
end
