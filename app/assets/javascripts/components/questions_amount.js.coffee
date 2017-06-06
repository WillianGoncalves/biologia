@QuestionsAmount = React.createClass
  displayName: 'QuestionsAmount'

  render: ->
    React.DOM.div
      className: 'col-md-3'
      React.DOM.div
        className: 'panel panel-default'
        React.DOM.div
          className: 'panel-heading'
          @props.type
        React.DOM.div
          className: 'panel-body'
          @props.amount
