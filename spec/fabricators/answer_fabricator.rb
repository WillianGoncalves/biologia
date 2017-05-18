Fabricator(:answer) do
  text    { Faker::Lorem.sentence }
  correct false
end

Fabricator(:right_answer, from: :answer) do
  text    { Faker::Lorem.sentence }
  correct true
end
