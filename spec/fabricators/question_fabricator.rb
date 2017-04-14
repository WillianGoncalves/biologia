Fabricator(:multiple_choice, from: :question) do
  statement {Faker::Lorem.sentence}
  question_type 0
  answers(count: 5)
  ability
  competence
end

Fabricator(:discursive, from: :question) do
  statement {Faker::Lorem.sentence}
  question_type 1
  answers(count: 1)
  ability
  competence
end

Fabricator(:true_false, from: :question) do
  statement {Faker::Lorem.sentence}
  question_type 2
  answers(count: 2)
  ability
  competence
end
