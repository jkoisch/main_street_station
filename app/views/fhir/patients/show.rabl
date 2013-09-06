object @patient => :patient

   node :id, :unless => lambda { |r| r.id.nil? } do |r|
     {:value => ERB::Util.h(r.id)}
   end

   child :text => :text do
     extends "fhir/patients/resource_content/text"
   end

   child({:identifier => :identifier}, :unless => lambda {|r| r.identifier.nil?}) do
     extends "fhir/patients/resource_content/identifiers"
   end

   child({ :name => :name}, :unless => lambda {|d| d.name.nil?}) do |d|

     node :given, :unless => lambda {|n| n.given.nil?} do |n|
       n.given
     end

     node :family, :unless => lambda {|n| n.family.nil?} do |n|
       n.family
     end

     node :use, :unless => lambda {|n| n.use.nil?} do |n|
       n.use
     end

     node :text, :unless => lambda {|n| n.text.nil?} do |n|
       n.text
     end

     child :period, :unless => lambda {|n| n.period.nil?} do
       extends "fhir/patients/resource_content/period"
     end

     node :prefix, :unless => lambda {|n| n.prefix.nil?} do |n|
       n.prefix
     end

     node :suffix, :unless => lambda {|n| n.suffix.nil?} do |n|
       n.suffix
     end
   end

    child({ :telecom => :telecom}, :unless => lambda {|d| d.telecom.nil?}) do |d|
      extends "fhir/patients/resource_content/contact"
    end

    child({ :gender => :gender }, :unless => lambda {|d| d.gender.nil?}) do
      extends "fhir/patients/resource_content/codeable_concept"
    end

    child({ :address => :address}, :unless => lambda {|d| d.address.nil?}) do |d|

      node :use, :unless => lambda {|a| a.use.nil?} do |a|
        a.use
      end

      node :text, :unless => lambda {|a| a.text.nil?} do |a|
        {:value => a.text}
      end

      node :line, :unless => lambda {|a| a.line.nil?} do |a|
        a.line
      end

      node :city, :unless => lambda {|a| a.city.nil?} do |a|
        a.city
      end

      node :state, :unless => lambda {|a| a.state.nil?} do |a|
        a.state
      end

      node :zip, :unless => lambda {|a| a.zip.nil?} do |a|
        a.zip
      end

      node :country, :unless => lambda {|a| a.country.nil?} do |a|
        a.country
      end

      child :period, :unless => lambda {|a| a.period.nil?} do
        extends "fhir/patients/resource_content/period"
      end
    end

    child :links, :unless => lambda {|r| r.links.nil?} do |r|
      extends "fhir/patients/resource_content/resource"
    end

    node :active, :unless => lambda { |r| r.active.nil? } do |r|
      {:value => ERB::Util.h(r.active)}
    end

    child :contact, :unless => lambda {|r| r.contact.nil?} do

      child :details, :unless => lambda {|c| c.details.nil?} do
        extends "fhir/patients/resource_content/details"
      end

      child :organization, :unless => lambda {|c| c.organization.nil?} do
        extends "fhir/patients/resource_content/resource"
      end

      child :relationships, :unless => lambda {|c| c.relationships.nil?} do
        extends "fhir/patients/resource_content/codeable_concept"
      end
    end

    child({ :provider => :provider}, :unless => lambda {|r| r.provider.nil?}) do
        extends "fhir/patients/resource_content/resource"
    end

    node :birthDate, :unless => lambda {|d| d.birthDate.nil?} do |d|
        d.birthDate
    end

    node :communication, :unless => lambda {|l| l.communication.nil?} do |l|
        extends "fhir/patients/resource_content/codeable_concept"
    end
