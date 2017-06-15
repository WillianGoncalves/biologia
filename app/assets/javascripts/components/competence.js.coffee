@Competence = React.createClass
  displayName: 'Competence'

  getInitialState: ->
    competence: @props.competence

  handleEdit: (e) ->

  handleDelete: (e) ->


  render: ->
    React.DOM.ul
      className: 'list-group'
      React.DOM.li
        className: 'list-group-item'
        React.DOM.a
          href: "/competences/#{@props.competence.id}/edit"
          @props.competence.description
