uuid = UUID.new

atom_feed({:id => "urn:uuid: #{uuid.generate}"}) do |feed|
  feed.title "FHIR Atom Feed Testing"
  feed.updated = Date.today
  feed.tag!('totalResults', @patients.count())

  @patients.each do |patient|
    feed.entry(patient, :url => 'http://localhost:3000/fhir/patients/@' + patient.id.to_s,
                        :id => "http://localhost:3000/fhir/patients/@#{patient.id}") do |entry|
      entry.title "Patient [#{patient.id.to_s}] from Gringotts Version 1"
      entry.category :scheme => 'http://localhost:3000/fhir/resource-types', :term => 'Patient'
      entry.link :rel => "self", :href => "http://localhost:3000/fhir/patients/@#{patient.id}"
      entry.updated Time.now

      entry.author do
        entry.name "imported from gringotts"
      end

      entry.content :type => 'text/xml' do |content|
        content.tag!("Patient", xmlns: "http://hl7.org/fhir") do |pnt|

          pnt.active :value => patient.active

          unless patient.deceasedDate.nil?
            pnt.deceasedDate value: patient.deceasedDate
          end

          unless patient.text.nil?
            pnt.text do
              pnt.status patient.text.status
              pnt.div "<b>foo</b>".html_safe, :type => 'html'  #patient.text.div, :type => "html", xmlns: "http://www.w3.org/1999/xhtml"
            end
          end

          unless patient.identifiers.nil?
            patient.identifiers.each do |identifier|
              pnt.identifiers do |identity|
                identity.key :value => identifier.identifier
                identity.label :value => identifier.label
                identity.system :value => identifier.system
                identity.use :value => identifier.use
              end
            end
          end

          pnt.birthDate patient.birthDate

          unless patient.gender.nil?
            pnt.gender do
              pnt.coding :value => patient.gender.coding
              pnt.primary :value => patient.gender.primary
              pnt.text :value => patient.gender.text
            end
          end

          unless patient.telecoms.nil?
            patient.telecoms.each do |telecom|
              pnt.telecom do |comm|
                comm.value :value => telecom.value
                comm.system :value => telecom.system
                comm.use :value => telecom.use
              end
            end
          end

          unless patient.addresses.nil?
            patient.addresses.each do |address|
              pnt.address do |addr|
                addr.city address.city
                addr.country address.country
                addr.line address.line
                addr.state address.state
                addr.text :value => address.text
                addr.use  address.use
                addr.zip address.zip
              end
            end
          end

          unless patient.names.nil?
            patient.names.each do |name|
              pnt.name do |_name|
                unless name.family.nil?
                  name.family.each do |kin|
                    _name.family kin
                  end
                end

                unless name.prefix.nil?
                  name.prefix.each do |pre|
                    _name.prefix :value => pre
                  end
                end

                _name.use name.use
              end
            end
          end

          unless patient.communication.nil?
            pnt.communication do
              pnt.coding :value => patient.communication.coding
              pnt.primary :value => patient.communication.primary
              pnt.text :value => patient.communication.text
            end
          end

        end
      end

      entry.summary :type => 'xhtml' do
        entry.div :xmlns => 'http://www.w3.org/1999/xhtml' do
          "#{patient.names[0].family[0]} - whatever"
        end
      end

      #entry.tag!('app:edited', Time.now) #custom tags
      #entry.tag!('xmlns', 'http://www.w3.org/2005/AtomTest')  #custom tags just in case

    end
  end

end