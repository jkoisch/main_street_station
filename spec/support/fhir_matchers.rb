RSpec::Matchers.define :parse_ehmbr_response do |json_file|
    match do |actual|
    raw_json = JSON.parse(File.read(json_file))
    actual.parse_ehmbr(raw_json) != nil
  end
end

RSpec::Matchers.define :match_fhir_json do |json_file, ignored={}|
  match do |actual|
    expected_json = JSON.parse(File.read(json_file))
    json_actual = JSON.parse(actual)
    json_actual.smooth!(ignored)
    json_actual == expected_json
  end
  failure_message do |actual|
    expected = JSON.parse(File.read(json_file))
    hash_response = JSON.parse(actual)
    hash_response.smooth!(ignored)
    expected.list_differences(hash_response).join("\n") + "\n"
  end
end

RSpec::Matchers.define :match_fhir_xml do |xml_file, ignored={}, detail=false|
  match do |actual|
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(actual)
    response_xml.smooth!(ignored)
    EquivalentXml.equivalent?(expected_xml, response_xml, {element_order: true, normalize_whitespace: true})
  end
  failure_message do |actual|
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(actual)
    response_xml.smooth!(ignored)
    temp_string = detail ? "\n" + 'Actual----' + response_xml.to_s + "\n" + 'Expected--' + expected_xml.to_s + "\n" : ''
    expected_xml.list_differences(response_xml).join("\n") + temp_string
  end
end

RSpec::Matchers.define :produce_fhir_json_like do |json_file|
  match do |actual|
    controller.prepend_view_path 'app/views/' + actual.rpartition('/')[0]
    response = render partial: actual, formats: :fhirj, locals: {resource: resource}
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
    response = render partial: actual, formats: :fhirx, locals: {resource: resource}
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(response)
    EquivalentXml.equivalent?(expected_xml, response_xml, {element_order: true, normalize_whitespace: true})
  end
  # noinspection RubyUnusedLocalVariable
  failure_message do |actual|
    expected_xml = Nokogiri::XML(File.read(xml_file))
    response_xml = Nokogiri::XML(response)
    expected_xml.list_differences(response_xml).join("\n")
  end
end

RSpec::Matchers.define :return_FHIR_JSON_object do |object_name|
  # noinspection RubyUnusedLocalVariable
  match do |actual|
    get "/fhir/#{object_name}/1.fhirj"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == object_name
  end
end

RSpec::Matchers.define :return_FHIR_XML_object do |object_name|
  match do |actual|
    body = Nokogiri::XML(actual.body)
    actual.content_type == Mime[:fhirx] &&
        body.first_element_child.name == object_name
  end
  failure_message do |actual|
    body = Nokogiri::XML(actual.body)
    if actual.content_type != Mime[:fhirx]
      "Content was not XML (received: #{actual.content_type.to_s})"
    elsif body.first_element_child.name != object_name
      "Body should contain a XML #{object_name} resource, received: <#{body.first_element_child.name}>"
    end
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

RSpec::Matchers.define :return_FHIR_JSON_bundle do |object_name|
  match do |actual|
    body = JSON.parse(actual.body)
    actual.content_type == Mime[:fhirj] &&
        body['resourceType'] == 'Bundle' &&
        body['entry'][0]['resource']['resourceType'] == object_name
  end
  failure_message do |actual|
    body = JSON.parse(actual.body)
    if actual.content_type != Mime[:fhirj]
      "Content was not JSON (received: #{actual.content_type.to_s})"
    elsif body['resourceType'] != 'Bundle'
      "Body should contain a JSON Bundle object, received: <#{body['resourceType']}>"
    elsif body['entry'][0]['resource']['resourceType'] != object_name
      "Bundle does not contain a <#{object_name}> resource"
    end
  end
end

RSpec::Matchers.define :return_FHIR_XML_bundle do |object_name|
  match do |actual|
    body = Nokogiri::XML(actual.body)
    actual.content_type == Mime[:fhirx] &&
        body.first_element_child.name == 'Bundle' &&
        body.xpath("//*[local-name()='resource']/*[local-name()='#{object_name}']").count > 0
  end
  failure_message do |actual|
    body = Nokogiri::XML(actual.body)
    if actual.content_type != Mime[:fhirx]
      "Content was not XML (received: #{actual.content_type.to_s})"
    elsif body.first_element_child.name != 'Bundle'
      "Body should contain a XML Bundle object, received: <#{body.first_element_child.name}>"
    elsif body.xpath("//*[local-name()='resource']/*[local-name()='#{object_name}']").count == 0
      "Bundle does not contain a <#{object_name}> resource"
    end
  end
end

RSpec::Matchers.define :return_FHIR_JSON_bundle_object do |object_name|
  # noinspection RubyUnusedLocalVariable
  # TODO: remove get and test content and accept headers
  match do |actual|
    get "/fhir/#{object_name}.fhirj"
    hash_body = JSON.parse(response.body)
    hash_body['resourceType'] == 'Bundle'
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
