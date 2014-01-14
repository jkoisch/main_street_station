module Fhir
  class FhirController < FhirBaseController
    before_filter :authenticate_user! #, except: [ :index, :show_old ]

  end
end
