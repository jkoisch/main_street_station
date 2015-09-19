RSpec::Matchers.define :parse_ehmbr_response do |json_file|
    match do |actual|
    raw_json = JSON.parse(File.read(json_file))
    actual.parse_ehmbr(raw_json) != nil
  end
end

RSpec::Matchers.define :produce_fhir_json_like do |json_file|
  match do |actual|
    controller.prepend_view_path 'app/views/' + actual.rpartition('/')[0]
    response = render partial: actual, formats: :json, locals: {resource: resource}
    expected_json = File.read(json_file)
    response == expected_json
  end
  # noinspection RubyUnusedLocalVariable
  failure_message do |actual|
    expected = JSON.parse(File.read(json_file))
    hash_response = JSON.parse(response)
    expected.list_differences(hash_response).join("\n") + "\n"
  end
end

RSpec::Matchers.define :produce_fhir_xml_like do |xml_file|
  match do |actual|
    controller.prepend_view_path 'app/views/' + actual.rpartition('/')[0]
    response = render partial: actual, formats: :xml, locals: {resource: resource}
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(response)
    EquivalentXml.equivalent?(expected_xml,response_xml, element_order: true)
    #xml_cmp(expected_xml, response)
    #false
  end
  # noinspection RubyUnusedLocalVariable
  failure_message do |actual|
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(response)
    expected_xml.list_differences(response_xml).join("\n")
    #"expected XML was:\n#{expected_xml}\n" +
    #    " generated: --------------------------------\n#{response_xml}\n"
  end
end

RSpec::Matchers.define :return_FHIR_JSON_object do |object_name|
  # noinspection RubyUnusedLocalVariable
  match do |actual|
    get "/fhir/#{object_name}/1.json"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == object_name
  end
end

RSpec::Matchers.define :return_an_OperationOutcome_when_failing_for do |error_path|
  # noinspection RubyUnusedLocalVariable
  match do |actual|
    GringottResponse.any_instance.stubs(:success?).returns(false)
    get "/fhir/#{error_path}"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == 'OperationOutcome'
  end
end

RSpec::Matchers.define :return_FHIR_JSON_bundle_object do |object_name|
  # noinspection RubyUnusedLocalVariable
  match do |actual|
    get "/fhir/#{object_name}.json"
    hash_body = JSON.parse(response.body)
    hash_body['type'] == 'collection'
  end
end

RSpec::Matchers.define :return_HTTP_success_for do |fhir_api_path|
  # noinspection RubyUnusedLocalVariable
  match do |actual|
    get "/fhir/#{fhir_api_path}"
    response.status === 200
  end
  # noinspection RubyUnusedLocalVariable
  failure_message do |actual|
    expected = 200
    "expected: #{expected} received: #{response.status}"
  end
end

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

# comparing xml is always a b-i-a-t-c-h in any testing environment.  here is a
# little snippet for ruby that, i think, it a good first pass at making it
# easier.  comment with your improvements please!
#
#
require 'rexml/document'

def xml_cmp (a, b)
  a = REXML::Document.new(a.to_s)
  b = REXML::Document.new(b.to_s)

  normalized = Class.new(REXML::Formatters::Pretty) do
    # noinspection RubySuperCallWithoutSuperclassInspection
    def write_text(node, output)
      super(node.to_s.strip, output)
    end
  end

  normalized.new(indentation=0,ie_hack=false).write(node=a, a_normalized='')
  normalized.new(indentation=0,ie_hack=false).write(node=b, b_normalized='')

  a_normalized == b_normalized
end
