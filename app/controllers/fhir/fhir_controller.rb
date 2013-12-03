class Fhir::FhirController < ApplicationController

  def get_gringotts_resources(resource, search_params="")
    unless retrieve_file_resource(resource)
      uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     resource.pluralize)
      unless search_params.empty?
        Rails.logger.info "Adding #{search_params}"
        uri.query = URI.encode(search_params)
      end
      wrap_response(Net::HTTP.get_response(uri))
    end
  end

  def get_resource(resource_name, id)
    unless retrieve_file_resource(resource_name)
      uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     "/#{resource_name.pluralize}/#{id}")
      wrap_response(Net::HTTP.get_response(uri))
    end
  end

  private
  def retrieve_file_resource(resource)
    if MainStreetStation::Application.config.respond_to?("gringotts_" + resource)
      GringottResponse.new(true, File.read(MainStreetStation::Application.config.send("gringotts_" + resource)))
    else
      nil
    end
  end

  def wrap_response(response)
    if response.is_a?(Net::HTTPSuccess)
      GringottResponse.new(true, JSON.parse(response.body))
    else
      GringottResponse.new(false, JSON.parse())
    end
  end
end