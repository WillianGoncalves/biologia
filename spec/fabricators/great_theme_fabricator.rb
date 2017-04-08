Fabricator(:great_theme) do
  discipline
  description {Faker::Lorem.words}
  knowledge_objects(count: 2)
end
