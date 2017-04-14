(function(services, dao){
  'use strict';

  $(document).ready(function(){

    var service = new services.QuestionsService($);
    var questionDao = new dao.QuestionsDao($);

    //armazena os selects em variáveis
    var disciplineSelect = $('#discipline');
    var greatThemesSelect = $('#great_theme');
    var knowledgeObjectsSelect = $('#knowledge_object');
    var abilitiesSelect = $('#ability');
    var competenceSelect = $('#competence');

    //faz a requisição das competências
    var competencesPromise = questionDao.getCompetences();

    competencesPromise.done(function(data){
      utils.fillSelect(competenceSelect, data);
    });

    //faz a requisição das disciplinas
    var disciplinesPromise = questionDao.getDisciplines();

    disciplinesPromise.done(function(data){
      utils.fillSelect(disciplineSelect, data);
    });

    //implementa o evento "onChange" do select de disciplinas
    disciplineSelect.on('change', function(){
      //pega o id da disciplina selecionada
      var disciplineId = $(this).val();

      //faz a requisição dos grandes temas
      var greatThemesPromise = questionDao.getGreatThemes(disciplineId);

      //carrega os grandes temas
      greatThemesPromise.done(function(data){
        utils.fillSelect(greatThemesSelect, data);
      });
    });

    //implementa o evento "onChange" do select de grandes temas
    greatThemesSelect.on('change', function(){
      //pega o id do grande tema selecionado
      var greatThemeId = $(this).val();

      //faz a requisição dos objetos de conhecimento
      var knowledgeObjectsPromise = questionDao.getKnowledgeObjects(greatThemeId);

      //limpa os selects dependentes
      knowledgeObjectsSelect.empty();
      abilitiesSelect.empty();

      //carrega os objetos de conhecimento
      knowledgeObjectsPromise.done(function(data){
        utils.fillSelect(knowledgeObjectsSelect, data);
      });
    });

    //implementa o evento "onChange" do select de objetos de conhecimento
    knowledgeObjectsSelect.on('change', function(){
      //pega o id do objeto de conhecimento selecionado
      var knowledgeObjectId = $(this).val();

      //faz a requisição das habilidades
      var abilitiesPromise = questionDao.getAbilities(knowledgeObjectId);

      //limpa o select de habilidades
      abilitiesSelect.empty();

      //carrega as habilidades
      abilitiesPromise.done(function(data){
        utils.fillSelect(abilitiesSelect, data);
      });
    });

    //implementa o evento "onclick" do botão que adiciona respostas
    $('#add_ability').on('click', function(){
      service.addAnswer($('#answer').val());

      //limpa o textarea com a resposta
      $('#answer').val('');
    });

    //implementa o evento "onclick" dos botões de exclusão de resposta
    $('#answers').on('click', 'button', function(){
      service.removeAnswer($(this).data('index'));
    });

    $('#salvar').on('click', function(){
      var question = service.buildQuestion();
      questionDao.save(question);
    });

  });

})(services, dao);
