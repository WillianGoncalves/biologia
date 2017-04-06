Fabricator(:answer) do
  text    {Faker::Lorem.sentence}
  correct false
end
