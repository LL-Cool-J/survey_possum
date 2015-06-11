json.array!(@surveys) do |survey|
  json.extract! survey, :id, :id, :author_id, :title, :description
  json.url survey_url(survey, format: :json)
end
