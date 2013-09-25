class Fhir::ConformanceController < ApplicationController
  before_filter :authenticate_user! , except: [:index]  #, :show]

  def index
    @conformance = File.read("#{Rails.root}/config/conformance.json")
    @data = JSON.parse(@conformance)
    render json: @conformance
  end

  private

  def use_https?
    false
  end

end
