uuid = UUID.new

atom_feed({id: "urn:uuid: #{uuid.generate}"}) do |feed|
  feed.title 'FHIR Atom Feed Testing'
  feed.updated = Date.today
  feed.tag!('totalResults', @patients.count)

  @patients.each do |patient|
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
        content.tag!('Patient', xmlns: 'http://hl7.org/fhir') do |pnt|

          pnt.active value: patient.active

          unless patient.deceased.nil?
            pnt.deceased value: patient.deceased
          end

          unless patient.text.nil?
            pnt.text do
              pnt.status patient.text.status
              pnt.div'"<b>foo</b>'.html_safe, :type => 'html'  #patient.text.div, :type => "html", xmlns: "http://www.w3.org/1999/xhtml"
            end
          end

          unless patient.identifier.nil?
            patient.identifier.each do |identifier|
              pnt.identifier do |identity|
                unless identifier.key.nil?
                  identity.key value: identifier.key
                end
                unless identifier.label.nil?
                  identity.label value: identifier.label
                end

                identity.system value: identifier.system unless identifier.system.nil?
                identity.use value: identifier.use unless identifier.use.nil?
                identity.assigner value: identifier.assigner unless identifier.assigner.nil?
                identity.period value: identifier.period unless identifier.period.nil?
              end
            end
          end

          pnt.birthDate patient.birthDate

          unless patient.gender.nil?
            patient.gender do
              pnt.gender.code value: patient.gender.code unless patient.gender.code.nil?
              pnt.gender.display value: patient.gender.display unless patient.gender.display.nil?
              pnt.gender.system value: patient.gender.system unless patient.gender.system.nil?
            end
          end


          unless patient.telecom.nil?
            patient.telecom.each do |telephony|
              pnt.telecom do |comm|
                comm.value value: telephony.value unless telephony.value.nil?
                comm.system value: telephony.system unless telephony.system.nil?
                comm.use value: telephony.use unless telephony.use.nil?
                comm.period value: telephony.value unless telephony.period.nil?
              end
            end
          end

          unless patient.address.nil?
            patient.address.each do |address|
              pnt.address do |addr|
                addr.city address.city
                addr.country address.country
                addr.line address.line
                addr.state address.state
                addr.text value: address.text
                addr.use  address.use
                addr.zip address.zip
              end
            end
          end

          unless patient.name.nil?
            patient.name.each do |name|
              pnt.name do |_name|
                unless name.family.nil?
                  name.family.each do |kin|
                    _name.family kin
                  end
                end

                unless name.prefix.nil?
                  name.prefix.each do |pre|
                    _name.prefix value: pre
                  end
                end

                _name.use name.use
              end
            end
          end

          unless patient.communication.nil?
            pnt.communication do
              pnt.coding value: patient.communication.coding
              pnt.primary value: patient.communication.primary
              pnt.text value: patient.communication.text
            end
          end

        end
      end

      entry.summary type: 'xhtml' do
        entry.div xmlns: 'http://www.w3.org/1999/xhtml' do
          entry.p "#{patient.name[0]} - whatever"
        end
      end

      #entry.tag!('app:edited', Time.now) #custom tags
      #entry.tag!('xmlns', 'http://www.w3.org/2005/AtomTest')  #custom tags just in case

    end
  end

end