@Answers = React.createClass
  displayName: 'Answers'
  
  render: ->
    React.DOM.ul
      className: 'list-group'
      for answer in @props.answers
        React.DOM.li
          key: answer.id
          className:
            if answer.correct
              'list-group-item list-group-item-success'
            else
              'list-group-item'
          answer.text
