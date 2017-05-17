module QuestionsHelper
  def question_type_for_select
    options = []
    Question.question_types.keys.each do |value|
      text = I18n.t("activerecord.attributes.question.enums.question_type.#{value}")
      options << [text, value]
    end
    options
  end

  def competences_for_select
    Competence.all.map{ |c| [c.description, c.id] }
  end
end
