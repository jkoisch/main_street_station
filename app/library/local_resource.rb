class LocalResource
  def self.get_local_resource_data(resource)
    JSON.parse(File.read(MainStreetStation::Application.config.send('gringotts_' + resource)))
  end

  def self.is_resource_local?(resource)
    MainStreetStation::Application.config.respond_to?('gringotts_' + resource)
  end
end