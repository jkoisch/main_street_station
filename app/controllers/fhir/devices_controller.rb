require 'net/http'

module Fhir
  class DevicesController < FhirBaseController
  RESOURCE = 'device'

  # GET /devices
  # GET /devices.json
  def index
    response = get_gringotts_resources(RESOURCE)
    if response.success?
      @devices = Fhir::Device.parse_ehmbr_list(response.body)

      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        format.html status: 500
        format.json status: 500
        format.xml  status: 500
      end
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    response = get_resource(RESOURCE, params[:id])
    if response.success?
      @device = Fhir::Device.parse_ehmbr(response.body)
    else
      render status: 500
    end
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.html { render action: 'new' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
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
  end
end
