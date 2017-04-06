Fabricator(:resposta) do
  texto   {Faker::Lorem.sentence}
  correta false
end
