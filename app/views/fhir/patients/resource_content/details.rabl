  node :maritalStatus, :unless => lambda {|d| d.maritalStatus.nil?} do |d|
    d.maritalStatus
  end

  node :deceased, :unless => lambda {|d| d.deceased.nil?} do |d|
    d.deceased
  end

  node :birthDate, :unless => lambda {|d| d.birthDate.nil?} do |d|
    d.birthDate
  end

  child({:identifiers => :identifier}, :unless => lambda {|d| d.identifiers.nil?}) do
    extends "fhir/patients/resource_content/identifiers"
  end

  child({ :names => :name}, :unless => lambda {|d| d.names.nil?}) do |d|

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

  child({ :gender => :gender }, :unless => lambda {|d| d.gender.nil?}) do

    node :system, :unless => lambda {|g| g.system.nil?} do |g|
      {:value => g.system}
    end

    node :display, :unless => lambda {|g| g.display.nil?} do |g|
      {:value => g.display}
    end

    node :code, :unless => lambda {|g| g.code.nil?} do |g|
      {:value => g.code}
    end

  end

  child({ :addresses => :addresses}, :unless => lambda {|d| d.addresses.nil?}) do

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

  child({ :telecoms => :telecom}, :unless => lambda {|d| d.telecoms.nil?}) do

    node :system, :unless => lambda {|t| t.system.nil?} do |t|
      {:value => t.system}
    end

    node :value, :unless => lambda {|t| t.value.nil?} do |t|
      {:value => t.value}
    end

    node :use, :unless => lambda {|t| t.use.nil?} do |t|
      {:value => t.use}
    end

    child :period, :unless => lambda {|t| t.period.nil?} do
        extends "fhir/patients/resource_content/period"
    end
  end

  child :photos, :unless => lambda {|d| d.photos.nil?} do
    node :type, :unless => lambda {|p| p.type.nil?} do |t|
      {:value => p.type}
    end

    node :url, :unless => lambda {|p| p.url.nil?} do |t|
      {:value => p.url}
    end

    node :display, :unless => lambda {|p| p.display.nil?} do |t|
      {:value => p.display}
    end
  end
