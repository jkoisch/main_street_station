object @patient => :Patient

  child :links, :unless => lambda {|r| r.links.nil?} do |r|
    extends "fhir/patients/resource"
  end

  node :id, :unless => lambda { |r| r.id.nil? } do |r|
    {:value => r.id}
  end

  node :active, :unless => lambda { |r| r.active.nil? } do |r|
    {:value => ERB::Util.h(r.active)}
  end

  child :animal, :unless => lambda {|r| r.animal.nil?} do
    extends "fhir/patients/animal"
  end

  child :contacts, :unless => lambda {|r| r.contacts.nil?} do

    child :details, :unless => lambda {|c| c.details.nil?} do
      extends "fhir/patients/details"
    end

    child :organization, :unless => lambda {|c| c.organization.nil?} do
      extends "fhir/patients/resource"
    end

    child :relationships, :unless => lambda {|c| c.relationships.nil?} do
      extends "fhir/patients/codeable_concept"
    end
  end

  node :deceasedDate, :unless => lambda {|r| r.deceasedDate.nil?} do |r|
    {:value => r.deceasedDate}
  end

  node :text, :unless => lambda {|r| r.text.nil?} do |r|
    {:value => r.text}
  end

  node :multipleBirth, :unless => lambda {|r| r.multipleBirth.nil?} do |r|
    {:value => r.multipleBirth}
  end

  child :identifiers => :identifiers do
    extends "fhir/patients/identifiers"
  end

  child :details => :details do
    extends "fhir/patients/details"
  end

  child({ :provider => :provider}, :unless => lambda {|r| r.provider.nil?}) do
    extends "fhir/patients/resource"
  end
