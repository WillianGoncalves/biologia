Fabricator(:knowledge_object) do
  description {Faker::Lorem.words}
  abilities(count: 2)
  great_theme {Fabricate :great_theme}
end
