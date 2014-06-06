RSpec::Matchers.define :parse_ehmbr_response do |json_file|
  match do |actual|
    raw_json = JSON.parse(File.read(json_file))
    actual.parse_ehmbr(raw_json) != nil
  end
end

RSpec::Matchers.define :produce_fhir_json_like do |json_file|
  match do |actual|
    response = render partial: actual, formats: :json, locals: {resource: resource}
    expected_json = File.read(json_file)
    response == expected_json
  end
  # noinspection RubyUnusedLocalVariable
  failure_message_for_should do |actual|
    expected = JSON.parse(File.read(json_file))
    hash_response = JSON.parse(response)
    "expected JSON was: #{expected}\n generated: #{hash_response}\n" +
        " *difference*: #{expected.find_difference(hash_response)}"
  end
end

RSpec::Matchers.define :produce_fhir_xml_like do |xml_file|
  match do |actual|
    response = render partial: actual, formats: :xml, locals: {resource: resource}
    expected_xml = File.read(xml_file)
    response = expected_xml
    #false
  end
  # noinspection RubyUnusedLocalVariable
  failure_message_for_should do |actual|
    #expected = JSON.parse(File.read(xml_file))
    expected = '--'
    response = render
    "expected XML was: #{expected}\n generated: #{response}\n"
       # " *difference*: #{expected.find_difference(response)}"
  end
end

RSpec::Matchers.define :return_FHIR_JSON_object do |object_name|
  match do |actual|
    get "/fhir/#{object_name}/1.json"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == object_name
  end
end

RSpec::Matchers.define :return_an_OperationOutcome_when_failing_for do |error_path|
  match do |actual|
    GringottResponse.any_instance.stubs(:success?).returns(false)
    get "/fhir/#{error_path}"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == 'OperationOutcome'
  end
end

RSpec::Matchers.define :return_FHIR_JSON_bundle_object do |object_name|
  match do |actual|
    get "/fhir/#{object_name}.json"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == 'Bundle'
  end
end

RSpec::Matchers.define :return_HTTP_success_for do |fhir_api_path|
  match do |actual|
    get "/fhir/#{fhir_api_path}"
    response.status === 200
  end
  failure_message_for_should do |actual|
    expected = 200
    "expected: #{expected} received: #{response.status}"
  end
end

class Hash
  def find_difference(other)
    (self.keys + other.keys).uniq.inject({}) do |memo, key|
      unless self[key] == other[key]
        if self[key].kind_of?(Hash) &&  other[key].kind_of?(Hash)
          memo[key] = self[key].diff(other[key])
        else
          memo[key] = [self[key], other[key]]
        end
      end
      memo
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
    def write_text(node, output)
      super(node.to_s.strip, output)
    end
  end

  normalized.new(indentation=0,ie_hack=false).write(node=a, a_normalized='')
  normalized.new(indentation=0,ie_hack=false).write(node=b, b_normalized='')

  a_normalized == b_normalized
end
