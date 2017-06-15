@Competences = React.createClass
  displayName: 'Competences'

  getInitialState: ->
    competences: @props.competences

  addCompetence: (competence) ->
    competences = React.addons.update(@state.competences, { $push: [competence] })
    @setState competences: competences

  render: ->
    React.DOM.div null,
      React.createElement CompetenceForm, handleNewCompetence: @addCompetence

      React.DOM.div
        className: 'panel panel-default'
        React.DOM.div
          className: 'panel-heading'
          'Competências'
        for competence in @state.competences
          React.createElement Competence, key: competence.id, competence: competence
