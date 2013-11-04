class Fhir::ConformanceController < ApplicationController
  def index
    @main_conformance = Nokogiri::XML(File.open("#{Rails.root}/config/conformance.xml"))
    @sin = @main_conformance.css("text/div").inner_html
    #@xml_data = JSON.parse(@main_conformance)

    #@sin = '<input type="btn"
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
