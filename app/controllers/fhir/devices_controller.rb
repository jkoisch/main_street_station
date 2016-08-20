require 'net/http'

module Fhir
  class DevicesController < FhirController
  RESOURCE = 'device'

  # GET /Device
  # GET /Device.json
  # GET /Device.xml
  def index
    response = get_gringotts_resources(RESOURCE, build_search_params(params))
    if response.success?
      @devices = Fhir::Device.parse_ehmbr_list(response.body)
    else
      send_operation_outcome(response)
    end
  end

  # GET /Device/1
  # GET /Device/1.json
  # GET /Device/1.xml
  def show
    response = get_resource(RESOURCE, params[:id])
    if response.success?
      @device = Fhir::Device.parse_ehmbr(response.body)
    else
      send_operation_outcome(response)
    end
  end

  # GET /Device/new
  def new
    @device = Device.new
  end

  # GET /Device/1/edit
  def edit
  end

  # POST /Device
  # POST /Device.json
  def create
    response = create_gringotts_resource(RESOURCE, params)
    if response
      if response.success?
        render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Device/#{response.body[:id]}"
      else
        send_operation_outcome(response, 400)
      end
    else
      send_operation_outcome(nil, 503, 'Application unavailable at this time')
    end
  end

  # PATCH/PUT /Device/1
  # PATCH/PUT /Device/1.json
  def update
    response = update_gringotts_resource(RESOURCE, params)
    if response
      if response.success?
        render nothing: true, status: 200
      else
        send_operation_outcome(response, 400)
      end
    else
      send_operation_outcome(nil, 503, 'Application unavailable at this time')
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params[:device]
    end

    def build_search_params(params)
      supported_params = {  identifier:   Fhir::TokenParameter,
                            manufacturer: Fhir::StringParameter,
                            model:        Fhir::StringParameter,
                            patient:      Fhir::ReferenceParameter,
                            type:         Fhir::TokenParameter
                            # ,udi:          Fhir::StringParameter
                          }
      populate_search_parameters(supported_params, params)
    end

    def old_build_search_params(params)

      supported_params = [:identifier, :location, :organization, :patient, :type, :udi]

      search_params = ''
      params.slice(*supported_params).each do |scope, value|
        case scope
          when 'identifier'
            if search_params.empty?
              search_params << "query[id_search][#{scope}]=#{value}"
            else
              search_params << ";query[id_search][#{scope}]=#{value}"
            end
          else
            search_params << "query[#{scope}_search]=#{value}"
        end
      end
      search_params
    end
  end
end
