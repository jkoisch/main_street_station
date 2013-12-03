class Fhir::ConformanceController < ApplicationController
  RESOURCE = 'conformance'

  def index
    response = get_gringotts_resources(RESOURCE)
    if response.successful?
      json_data = JSON.parse(response.body, opts={:symbolize_names => true})
      @conformances = Fhir::Conformance.init_from_ember(json_data)

      respond_to do |format|
        format.html
        format.atom
        format.json
        format.xml
      end
    else
      logger.warn response
      respond_to do |format|
        format.html status: 500
        format.json status: 500
        format.xml  status: 500
      end
    end
  end

  def index_old
    @main_conformance = Nokogiri::XML(File.open("#{Rails.root}/config/conformance.xml"))
    @sin = @main_conformance.css("text/div").inner_html
    #@xml_data = JSON.parse(@main_conformance)

    respond_to do |format|
      format.html do
        render :html => @sin
      end
      format.json do
        render :json => @main_conformance
      end
      format.xml do
        render :xml => @xml_data
      end
    end
  end

  def download
    send_file 'config/conformance.' + params[:type], :type => "text/xml"
  end

  private

  def use_https?
    false
  end

end
