xml.instruct!
xml.family_histories do
  @family_histories.each do |family_history|
    xml.family_history do
      xml << render(:partial => 'family_history', :locals => { :resource => family_history })
    end
  end
end