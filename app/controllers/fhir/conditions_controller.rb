require 'net/http'

module Fhir
  class ConditionsController < FhirController
    RESOURCE = 'condition'


    # GET /conditions
    # GET /conditions.json
    def index
      response = get_gringotts_resources(RESOURCE)
      logger.info "response: #{response.body}"
      if response.success?
        @conditions = Fhir::Condition.parse_ehmbr_list(response.body)

        respond_to do |format|
          #format.html
          #format.atom
          format.json
          #format.xml
        end
      else
        logger.warn response
        respond_to do |format|
          format.html status: 500
          format.json status: 500
          format.xml status: 500
        end
      end
    end

    # GET /conditions/1
    # GET /conditions/1.json
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @condition = Fhir::Condition.parse_ehmbr(response.body)
        puts @condition
      else
        logger.warn response
        render status: 500
      end
      #if response.is_a?(Net::HTTPSuccess)
      #  json_data = JSON.parse(response.body, opts={:symbolize_names => true})
      #  @patient = Fhir::Condition.init_from_ember(json_data)
      #
      #  respond_to do |format|
      #    format.html
      #    format.json
      #    format.xml
      #  end
      #else
      #  logger.warn response
      #  render :status => 500
      #end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params[:condition]
    end

    def build_search_params(params)

    end
  end

end
