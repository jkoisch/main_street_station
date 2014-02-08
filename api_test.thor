require "rest-client"
require "json"

class ApiTest < Thor
  desc 'simple_index RESOURCE', 'Process the CSV file and apply updates against the POSP DM database'
  def simple_index(resource)

    resp = RestClient.get "http://localhost:3001/fhir/#{resource}", {accept: :json}
  rescue => e
    puts "****** FAILURE ******"
    puts e
  end

  desc 'secure_index RESOURCE', 'Process the CSV file and apply updates against the POSP DM database'
  def secure_get(resource)
    resp = RestClient.get "http://localhost:3000/clinics/#{row[2]}", {accept: :json}
    clinic = Clinic.new(JSON.parse(resp))
    clinic.address = row[7]
    clinic.contact_name = row[9]
    clinic.phone = row[10]
    clinic.process_pc(row[1])
    begin
      RestClient.patch "http://localhost:3000/clinics/#{row[2]}", {clinic: clinic.to_hash}.to_json,  {content_type: :json, accept: :json}
    rescue => e2
      puts "Fail in update"
      puts e2
    end
  rescue RestClient::ResourceNotFound => e
    new_csv << [row[2],row[3],row[4],'f',nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,'{}']
    puts "    ~~~ New Clinic"
  rescue => e
    puts "****** FAILURE ******"
    puts e
  end
end
