# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Mime::Type.register 'application/fhir+json', :fhirj
Mime::Type.register 'application/fhir+xml', :fhirx

# ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup('application/fhir+json')] =
#     lambda do |body|
#       JSON.parse(body)
#     end

original_parsers = ActionDispatch::Request.parameter_parsers
fhir_xml_parser = -> (raw_post) { Hash.from_xml(raw_post) || {} }
fhir_json_parser = -> (raw_post) { JSON.parse(raw_post) || {} }
ActionDispatch::Request.parameter_parsers = {fhirx: fhir_xml_parser, fhirj: fhir_json_parser}.merge(original_parsers)