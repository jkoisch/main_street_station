object @patient => :patient

   child :links, :unless => lambda {|r| r.links.nil?} do |r|
     extends "fhir/patients/resource_content/resource"
   end

   node :id, :unless => lambda { |r| r.id.nil? } do |r|
     {:value => ERB::Util.h(r.id)}
   end

   node :active, :unless => lambda { |r| r.active.nil? } do |r|
     {:value => ERB::Util.h(r.active)}
   end

   child :animal, :unless => lambda {|r| r.animal.nil?} do
     extends "fhir/patients/resource_content/animal"
   end

   child :contacts, :unless => lambda {|r| r.contacts.nil?} do

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

   node :deceasedDate, :unless => lambda {|r| r.deceasedDate.nil?} do |r|
     {:value => r.deceasedDate}
   end

   child :text => :text do
     extends "fhir/patients/resource_content/text"
   end

   node :multipleBirth, :unless => lambda {|r| r.multipleBirth.nil?} do |r|
     {:value => r.multipleBirth}
   end

   child({:identifiers => :identifiers}, :unless => lambda {|r| r.identifiers.nil?}) do
     extends "fhir/patients/resource_content/identifiers"
   end

   child :details => :details do
     extends "fhir/patients/resource_content/details"
   end

   child({ :provider => :provider}, :unless => lambda {|r| r.provider.nil?}) do
     extends "fhir/patients/resource_content/resource"
   end
