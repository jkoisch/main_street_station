class Fhir::FhirController < ApplicationController

  def get_gringotts_resources(resource, search_params="")
    uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                   resource.pluralize)
    unless search_params.empty?
      Rails.logger.info "Adding #{search_params}"
      uri.query = URI.encode(search_params)
    end
    Net::HTTP.get_response(uri)
  end

  def get_resource(resource_name, id)
    uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                   "/#{resource_name.pluralize}/#{id}")
    Net::HTTP.get_response(uri)
  end
end