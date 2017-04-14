module QuestionsHelper
  def question_type_for_select
    options = []
    Question.question_types.keys.each do |value|
      text = I18n.t("activerecord.attributes.question.enums.question_type.#{value}")
      options << [text, value]
    end
    options
  end
end
