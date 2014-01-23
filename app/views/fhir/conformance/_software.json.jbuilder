json.software do
  json.name         software.name
  json.version      software.version
  json.releaseDate  software.release_date
end unless software.nil?