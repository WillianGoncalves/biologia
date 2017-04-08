Fabricator(:knowledge_object) do
  description {Faker::Lorem.words}
  abilities(count: 2)
end
