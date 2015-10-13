class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.json
  def index
    @conformance = Fhir::Conformance.parse_ehmbr(LocalResource.get_local_resource_data('conformance'))
  end
end