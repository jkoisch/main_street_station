module Fhir
  class Base
    attr_accessor :text

    def ehmbr_text=(detail)
      @text = detail
    end
  end
end
