object @observation => :observation

  child :name => :name do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  node :value, :unless => lambda { |r| r.value.nil? } do |r|
    {:value => ERB::Util.h(r.value)}
  end

  child :interpretation => :interpretation do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  node :comments, :unless => lambda { |r| r.comments.nil? } do |r|
    {:value => ERB::Util.h(r.comments)}
  end

  node :applies, :unless => lambda { |r| r.applies.nil? } do |r|
    {:value => ERB::Util.h(r.applies)}
  end

  node :issued, :unless => lambda { |r| r.issued.nil? } do |r|
    {:value => ERB::Util.h(r.issued)}
  end

  node :status, :unless => lambda { |r| r.status.nil? } do |r|
    {:value => ERB::Util.h(r.status)}
  end

  node :reliability, :unless => lambda { |r| r.reliability.nil? } do |r|
    {:value => ERB::Util.h(r.reliability)}
  end

  child :bodySite => :bodySite do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :method => :method do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :identifier => :identifier do
    extends "fhir/observations/resource_content/identifiers"
  end

  child :subject => :subject do
    extends "fhir/observations/resource_content/resource"
  end

  child :performer => :performer do
    extends "fhir/observations/resource_content/resource"
  end

  child({ :referenceRange => :referenceRange}, :unless => lambda{|r| r.referenceRange.nil?} do |r|
    extends "fhir/patients/resource_content/referenceRange"
  end

  child({ :components => :components}, :unless => lambda{|r| r.components.nil? do |r|
    extends "fhir/observations/resource_content/component
  end




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