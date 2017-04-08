json = eval File.read(Rails.root.join('old', 'js', 'biologia.json').to_s)

ActiveRecord::Base.transaction do
  discipline = Discipline.create(description: json[:disciplina])

  json[:grandesTemas].each do |gt|
    greate_theme = GreatTheme.create(description: gt[:descricao], discipline: discipline)

    gt[:objetosConhecimento].each do |oc|
      ko = KnowledgeObject.create(description: oc[:descricao], great_theme: greate_theme)

      oc[:habilidades].each do |h|
        Ability.create(description: h[:descricao], knowledge_object: ko)
      end
    end
  end
end
