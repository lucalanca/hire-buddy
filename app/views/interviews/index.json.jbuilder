json.array!(@interviews) do |interview|
  json.extract! interview, 
  json.url interview_url(interview, format: :json)
end
