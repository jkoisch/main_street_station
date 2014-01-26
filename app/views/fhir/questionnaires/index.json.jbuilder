json.array!(@questionnaires) do |questionnaire|
  json.extract! questionnaire, 
  json.url questionnaire_url(questionnaire, format: :json)
end
