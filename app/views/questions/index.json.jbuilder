json.questions @questions do |q|
  json.(q, :id, :statement, :question_type)

  json.ability do
    json.(q.ability, :id, :description)
    json.knowledge_object do
      json.(q.ability.knowledge_object, :id, :description)
      json.great_theme do
        json.(q.ability.knowledge_object.great_theme, :id, :description)
        json.discipline do
          json.(q.ability.knowledge_object.great_theme.discipline, :id, :description)
        end
      end
    end
  end

  json.answers q.answers do |a|
    json.(a, :id, :text, :correct)
  end
end
