xml.instruct!
xml.conditions do
  @conditions.each do |condition|
    xml.condition do
      xml << render(:partial => 'condition', :locals => { :resource => condition })
    end
  end
end