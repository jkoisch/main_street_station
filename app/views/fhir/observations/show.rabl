#object @observation => :observation do
#end
object false

  child :name => :name do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  node :value, :unless => lambda { |r| r.value.nil? } do |r|
    {:value => ERB::Util.h(r.value)}
  end

  child :interpretation, :unless => lambda{|r| r.interpretation.nil? } do
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

  child :bodySite, :unless => lambda{|r| r.bodySite.nil? } do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :method, :unless => lambda { |r| r.method.nil? } do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :identifier, :unless => lambda { |r| r.identifier.nil? } do
    extends "fhir/observations/resource_content/identifiers"
  end

  child({:subject => :subject}, :unless => lambda{ |r| r.subject.nil? }) do
    extends "fhir/observations/resource_content/resource_observation"
  end

  child({:performer => :performer}, :unless => lambda{ |r| r.performer.nil? }) do
    extends "fhir/observations/resource_content/resource_observation"
  end

  #child({ :referenceRange => :referenceRange}, :unless => lambda{|r| r.referenceRange.nil?} do |r|
  #  extends "fhir/patients/resource_content/referenceRange"
  #end

  child({ :component => :component}, :unless => lambda{|r| r.component.nil?}) do
    extends "fhir/observations/resource_content/component"
  end
