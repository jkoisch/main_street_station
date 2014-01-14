RSpec::Matchers.define :parse_ehmbr_response do |raw_json|
  match do |actual|
    actual.parse_ehmbr(raw_json) != nil
  end
end

RSpec::Matchers.define :produce_fhir_json_like do |expected_json|
  match do |actual|
    response = render
    puts response
    #rendered == response
    false
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

def xml_cmp a, b
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
