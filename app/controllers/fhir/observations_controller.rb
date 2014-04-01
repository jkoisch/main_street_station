class Fhir::ObservationsController < Fhir::FhirController
  RESOURCE = 'observation'

  def index
    response = get_gringotts_resources(RESOURCE)
    if response.success?
      @observations = Fhir::Observation.parse_ehmbr_list(response.body)

      respond_to do |format|
        format.html
        format.atom
        format.json
        format.xml
      end
    else
      logger.warn response
      respond :status => 500
    end
  end

  def show
    response = get_resource(RESOURCE, params[:id])
    if response.success?
      @observation = Fhir::Observation.parse_ehmbr(response.body)
    else
      logger.warn response
      render status: 500
    end
  end

  def create_deontik_observation(dtl)
    redirect_to home_path
  end
end
