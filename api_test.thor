require 'rest-client'
require 'json'

class ApiTest < Thor
  desc 'simple_index RESOURCE', ''
  def simple_index(resource)
    begin
      resp = RestClient.get "http://localhost:3000/fhir/#{resource}", {accept: :json}
      puts 'SUCCESS!!'
    rescue => e
      puts '****** FAILURE ******'
      puts e
    end
  end

  desc 'secure_get RESOURCE USER_NAME PASSWORD', ''
  def secure_get(resource, user_name, password)
    resp = RestClient.post 'http://localhost:3000/login', {user_name: user_name, password: password}, {accept: :json}
    token = 'Token token=' + JSON.parse(resp)['authentication_token']
    puts token
    begin
      RestClient.get "http://localhost:3000/fhir/#{resource}/1",  {accept: :json, Authorization: token}
    rescue RestClient::ResourceNotFound => e
      puts "#{resource} - 1  was not found"
      puts e
    rescue => e2
      puts 'Fail in get'
      puts e2
    end
  rescue => e
    puts '****** FAILURE ******'
    puts e
  end
end

# Token based login authentication
#  1. Login
#  2. get token on return
#  3. use token as part of query