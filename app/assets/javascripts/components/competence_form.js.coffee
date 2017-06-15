@CompetenceForm = React.createClass
  displayName: 'CompetenceForm'

  getInitialState: ->
    description: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/competences', { competence: @state }, (data) =>
      @props.handleNewCompetence data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
    @state.description

  render: ->
    React.DOM.form
      id: 'competence_form'
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Descrição'
          name: 'description'
          value: @state.description
          onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Adicionar competência'
