module Fhir
  class BaseResource
    extend AttributeDefs

    attr_accessor :text

    def ehmbr_text=(detail)
      @text = detail
    end

  end
end
