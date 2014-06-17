uuid = UUID.new

atom_feed({id: "urn:uuid: #{uuid.generate}"}) do |feed|
  feed.title 'FHIR Atom Feed Testing'
  feed.updated = Date.today
  feed.tag!('totalResults', @patients.count)

  @observations.each do |observation|
    feed.entry(patient, url: 'http://localhost:3000/fhir/patients/@' + patient.id.to_s,
               id: "http://localhost:3000/fhir/patients/@#{patient.id}") do |entry|
      entry.title "Patient [#{patient.id.to_s}] from Gringotts Version 1"
      entry.category scheme: 'http://localhost:3000/fhir/resource-types', term: 'Patient'
      entry.link rel: 'self', href: "http://localhost:3000/fhir/patients/@#{patient.id}"
      entry.updated Time.now

      entry.author do
        entry.name 'imported from gringotts'
      end

      entry.content type: 'text/xml' do |content|
        render(partial: 'observation', resource: observations)
      end
    end
  end
end

