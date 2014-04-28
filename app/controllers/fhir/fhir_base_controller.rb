class Fhir::FhirBaseController < ApplicationController
  def get_gringotts_resources(resource, search_params="")
    local_response = retrieve_file_resource(resource, true)
    unless local_response
      uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     resource.pluralize)
      unless search_params.empty?
        Rails.logger.info "Adding #{search_params}"
        uri.query = URI.encode(search_params)
      end
      wrap_response(Net::HTTP.get_response(uri))
    else
      local_response
    end
  end

  def get_resource(resource_name, id)
    local_response = retrieve_file_resource(resource_name, false, id)
    unless local_response
      uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     "/#{resource_name.pluralize}/#{id}")
      wrap_response(Net::HTTP.get_response(uri))
    else
      local_response
    end
  end

  private
  def retrieve_file_resource(resource, list=false, id=nil)
    if MainStreetStation::Application.config.respond_to?("gringotts_" + resource)
      logger.debug "*** Retrieving resource #{resource} id: #{id} from file #{MainStreetStation::Application.config.send("gringotts_" + resource)}"
      fixed_json = JSON.parse(File.read(MainStreetStation::Application.config.send("gringotts_" + resource)))

      if list
        GringottResponse.new(true, [ fixed_json ])
      elsif id && id.to_i == 1
        logger.debug "*** display for #{resource} id:1 #{fixed_json}"
        GringottResponse.new(true, fixed_json)
      else
        nil
      end
    else
      nil
    end
  end

  def wrap_response(response)
    if response.is_a?(Net::HTTPSuccess)
      GringottResponse.new(true, JSON.parse(response.body))
    else
      logger.error "Gringotts ERROR #{response.code} #{response.message}"
      GringottResponse.new(false, {})
    end
  end
end