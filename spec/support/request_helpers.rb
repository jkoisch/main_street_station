module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module XmlHelpers
    def xml
      @xml ||= Nokogiri::XML(response.body)
    end
  end
end