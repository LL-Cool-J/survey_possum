json.array!(@surveys) do |survey|
  json.extract! survey, :id, :author_id, :title, :description
  json.url survey_url(survey, format: :json)
end
