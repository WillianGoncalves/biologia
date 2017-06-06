@Questions = React.createClass
  displayName: 'Questions'

  getInitialState: ->
    questions: @props.questions

  multipleChoiceQuestions: ->
    multipleChoice = @state.questions.filter (val) -> val.question_type == 'multiple_choice'
    multipleChoice.length

  discursiveQuestions: ->
    discursive = @state.questions.filter (val) -> val.question_type == 'discursive'
    discursive.length

  trueFalseQuestions: ->
    trueFalse = @state.questions.filter (val) -> val.question_type == 'true_false'
    trueFalse.length

  totalQuestions: ->
    @multipleChoiceQuestions() + @discursiveQuestions() + @trueFalseQuestions()

  render: ->
    React.DOM.div null,
      React.DOM.div
        className: 'row'
        React.createElement QuestionsAmount, type: "Múltipla escolha", amount: @multipleChoiceQuestions()
        React.createElement QuestionsAmount, type: 'Discursivas', amount: @discursiveQuestions()
        React.createElement QuestionsAmount, type: 'Verdadeiro/Falso', amount: @trueFalseQuestions()
        React.createElement QuestionsAmount, type: 'Total', amount: @totalQuestions()
      for question, index in @state.questions
        React.createElement Question, key: question.id, question: question, index: index
