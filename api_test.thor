require 'rest-client'
require 'json'
require 'highline/import'

class ApiTest < Thor
  HEROKU_Mainstreet = 'whispering-sierra-2314.herokuapp.com'
  HEROKU_Gringotts  = 'protected-garden-4145.herokuapp.com'

  desc 'simple_index RESOURCE', 'Run a simple index on a resource'
  option :port, type: :numeric, default: 3000, aliases: 'p'
  def simple_index(resource)
    begin
      resp = RestClient.get "http://localhost:#{options[:port]}/fhir/#{resource}", {accept: :json}
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

  desc 'heroku_smoke_test', 'Run a series of tests against the Heroku installed YouCentric apps to verify things are operational'
  option :username, required: true, type: :string, aliases: 'u'
  def heroku_smoke_test
    puts 'Testing YouCentric on Heroku... '
    puts '   testing Mainstreet up'
    begin
      RestClient.get "http://#{HEROKU_Mainstreet}/fhir/metadata",  {accept: :json}
      puts '         ...success'
      puts '   testing Organization retrieve (login not required)'
      begin
        RestClient.get "http://#{HEROKU_Mainstreet}/fhir/Organization/1",  {accept: :json}
        puts '         ...success'
        puts '   testing Organization index'
        begin
          RestClient.get "http://#{HEROKU_Mainstreet}/fhir/Organization",  {accept: :json}
          puts '         ...success'
          puts '   testing API login'
          begin
            pw = ask("-->enter password for #{options[:username]}: ") { |q| q.echo = '@'}
            resp = RestClient.post "http://#{HEROKU_Mainstreet}/api_session", {user_name: options[:username], password: pw}, {accept: :json}
            token = 'Token token=' + JSON.parse(resp)['authentication_token']
            puts '         ...success'
            puts '   testing Patient retrieve (requires active session)'
            begin
              RestClient.get "http://#{HEROKU_Mainstreet}/fhir/Patient/1",  {accept: :json, Authorization: token}
              puts '         ...success'
            rescue => e
              puts '****** FAILURE ******'
              puts e
            end
          rescue => e
            puts '****** FAILURE ******'
            puts e
          end
        rescue => e
          puts '****** FAILURE ******'
          puts e
        end
      rescue => e
        puts '****** FAILURE ******'
        puts e
      end
      puts 'done'
    rescue => e
      puts '****** FAILURE ******'
      puts e
    end
  end
end

# Token based login authentication
#  1. Login
#  2. get token on return
#  3. use token as part of query