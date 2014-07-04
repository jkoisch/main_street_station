module FhirInterface
  module Types
    class Element
      attr_accessor :extension
    end

    class Address < Element
      attr_accessor :use,:text,:line,:city,:state,:zip,:country,:period
    end

    class Attachment < Element
      attr_accessor :contentType,:language,:data,:url,:size,:hash,:title
    end

    class CodeableConcept < Element
      attr_accessor :coding,:text
    end

    class Coding < Element
      attr_accessor :system,:version,:code,:display,:primary,:valueSet
    end

    class Contact < Element
      attr_accessor :system,:value,:use,:period
    end

    class HumanName < Element
      attr_accessor :use,:text,:family,:given,:prefix,:suffix,:period
    end

    class Identifier < Element
      attr_accessor :use,:label,:system,:value,:period,:assigner
    end

    class Period < Element
      attr_accessor :start,:end
    end

    class Quantity < Element
      attr_accessor :value,:comparator,:units,:system,:code
    end

    class Range < Element
      attr_accessor :low,:high
    end

    class Ratio < Element
      attr_accessor :numerator,:denominator
    end

    class Repeat < Element
      attr_accessor :frequency,:when,:duration,:units,:count,:end
    end

    class SampledData < Element
      attr_accessor :origin,:period,:factor,:lowerLimit,:upperLimit,:dimensions,:data
    end

    class Schedule < Element
      attr_accessor :event
    end
  end
end