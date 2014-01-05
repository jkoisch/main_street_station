RSpec::Matchers.define :parse_ehmbr_response do |raw_json|
  match do |actual|
    actual.parse_ehmbr(raw_json) != nil
  end
end