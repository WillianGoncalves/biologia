@Question = React.createClass
  displayName: 'Question'

  render: ->
    React.DOM.div
      className: 'panel panel-default'
      key: @props.question.id
      React.DOM.div
        className: 'panel-heading'
        React.DOM.div
          React.DOM.label null,
            "Questão #{@props.index + 1}"
          React.DOM.label
            className: 'question-subtitle text-muted'
            "#{@props.question.ability.knowledge_object.great_theme.discipline.description} > "
            "#{@props.question.ability.knowledge_object.great_theme.description} > "
            "#{@props.question.ability.knowledge_object.description} > "
            "#{@props.question.ability.description}"
          React.DOM.div
            className: 'btn-group'
            role: 'group'
            React.DOM.a
              href: "/questions/#{@props.question.id}/edit"
              className: 'btn btn-default'
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
            React.DOM.a
              href: "/questions/#{@props.question.id}"
              className: 'btn btn-danger'
              'data-method': 'delete'
              'data-confirm': 'Confirme'
              rel: 'nofollow'
              React.DOM.span
                className: 'glyphicon glyphicon-remove'
      React.DOM.div
        className: 'panel-body'
        @props.question.statement
      React.createElement Answers, answers: @props.question.answers
