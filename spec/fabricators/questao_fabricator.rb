Fabricator(:multipla_escolha, from: :questao) do
  enunciado {Faker::Lorem.sentence}
  tipo 0
  respostas(count: 5)
end

Fabricator(:discursiva, from: :questao) do
  enunciado {Faker::Lorem.sentence}
  tipo 1
  respostas(count: 1)
end

Fabricator(:verdadeiro_falso, from: :questao) do
  enunciado {Faker::Lorem.sentence}
  tipo 2
  respostas(count: 2)
end
