class Fhir::FhirBaseController < ApplicationController
  attr_accessor :uri

  FHIR_LOCATION_ROOT = 'http://mainstreet.youcentric.com/fhir'

  def populate_search_parameters(parameter_list, params)
    parameter_array = []
    # build the list params that match something in our list
    filtered_params = params.select do |field, value|
      # strip the modifier from the param name prior to lookup
      parameter_list.has_key?((field.include?(':') ? field.partition(':')[0] : field).to_sym)
    end

    filtered_params.each_pair do |raw_field, value|
      field = raw_field.include?(':') ? raw_field.partition(':')[0] : raw_field
      parameter_array << parameter_list[field.to_sym].parse(raw_field, value)
    end

    produce_query_string(parameter_array)
  end

  def get_gringotts_resources(resource, search_params='')
    local_response = retrieve_file_resource(resource, true)
    if local_response
      local_response
    else
      @uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     resource.pluralize)
      unless search_params.empty?
        Rails.logger.info "Adding #{search_params}"
        @uri.query = URI.encode(search_params)
      end
      wrap_response(Net::HTTP.get_response(@uri))
    end
  end

  def get_resource(resource_name, id)
    local_response = retrieve_file_resource(resource_name, false, id)
    if local_response
      local_response
    else
      uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                     "/#{resource_name.pluralize}/#{id}")
      wrap_response(Net::HTTP.get_response(uri))
    end
  end

  def create_gringotts_resource(resource, params)
    uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                   resource.pluralize)
    wrap_response(Net::HTTP.post_form(uri, client: params))
  end

  def update_gringotts_resource(resource, params)
    uri = URI.join(MainStreetStation::Application.config.gringotts_url,
                   resource.pluralize)
    wrap_response(Net::HTTP.post_form(uri, client: params))
  end

  def send_operation_outcome(response, the_status = :internal_server_error, error_message=nil)
    if response
      logger.warn response.message
      @operation_outcome = Fhir::OperationOutcome.build(severity: 'error', details: response.message)
    else
      if error_message
        logger.error error_message
        @operation_outcome = Fhir::OperationOutcome.build(severity: 'error', details: error_message)
      else
        logger.error '**No error text and no response passed to send OperationOutcome**'
        @operation_outcome = Fhir::OperationOutcome.build(severity: 'error',
                                                          details: 'An internal error occurred')
      end
    end
    render 'operation_outcome', status: the_status
  end

  def produce_query_string(queries)
    if queries.count > 0
      CGI.unescape({query: queries.reduce({}, :merge)}.to_query)
    else
      ''
    end
  end

  private
  def retrieve_file_resource(resource, list=false, id=nil)
    if MainStreetStation::Application.config.respond_to?('gringotts_' + resource)
      logger.debug "*** Retrieving resource #{resource} id: #{id} from file #{MainStreetStation::Application.config.send('gringotts_' + resource)}"
      fixed_json = JSON.parse(File.read(MainStreetStation::Application.config.send('gringotts_' + resource)))

      if list
        GringottResponse.new(true, [ fixed_json ])
      elsif id
        if id.to_i == 1
          logger.debug "*** display for #{resource} id:1 #{fixed_json}"
          GringottResponse.new(true, fixed_json)
        else
          resp = GringottResponse.new(false, nil)
          resp.message = "#{resource} with id: #{id} not found"
          resp
        end
      else
        nil
      end
    else
      nil
    end
  end

  def wrap_response(response)
    if response.is_a?(Net::HTTPSuccess)
      logger.warn 'Success from Gringotts'
      logger.warn response.body
      GringottResponse.new(true, JSON.parse(response.body))
    else
      logger.error "Gringotts ERROR #{response.code} #{response.message}"
      resp = GringottResponse.new(false, {})
      resp.message = response.message
      resp
    end
  end
end