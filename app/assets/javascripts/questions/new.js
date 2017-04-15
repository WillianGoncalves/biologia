(function(services, dao){
  'use strict';

  $(document).ready(function(){

    var service = new services.QuestionsService($);
    var questionDao = new dao.QuestionsDao();
    var competencesDao = new dao.CompetencesDao();
    var disciplinesDao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();
    var knowledge_objects_dao = new dao.KnowledgeObjectsDao();
    var abilitiesDao = new dao.AbilitiesDao();

    //armazena os selects em variáveis
    var disciplineSelect = $('#discipline');
    var great_theme_select = $('#great_theme');
    var knowledge_objects_select = $('#knowledge_object');
    var abilitiesSelect = $('#ability');
    var competenceSelect = $('#competence');

    //faz a requisição das competências
    var competencesPromise = competencesDao.all();

    competencesPromise.done(function(data){
      utils.fillSelect(competenceSelect, data);
    });

    //faz a requisição das disciplinas
    var disciplinesPromise = disciplinesDao.all();

    disciplinesPromise.done(function(data){
      utils.fillSelect(disciplineSelect, data);
    });

    //implementa o evento "onChange" do select de disciplinas
    disciplineSelect.on('change', function(){
      //pega o id da disciplina selecionada
      var disciplineId = $(this).val();

      //faz a requisição dos grandes temas
      var great_themes_promise = great_themes_dao.all(disciplineId);

      //carrega os grandes temas
      great_themes_promise.done(function(data){
        utils.fillSelect(great_theme_select, data);
      });
    });

    //implementa o evento "onChange" do select de grandes temas
    great_theme_select.on('change', function(){
      //pega o id do grande tema selecionado
      var great_theme_id = $(this).val();

      //faz a requisição dos objetos de conhecimento
      var knowledge_objects_promise = knowledge_objects_dao.all(great_theme_id);

      //limpa os selects dependentes
      knowledge_objects_select.empty();
      abilitiesSelect.empty();

      //carrega os objetos de conhecimento
      knowledge_objects_promise.done(function(data){
        utils.fillSelect(knowledge_objects_select, data);
      });
    });

    //implementa o evento "onChange" do select de objetos de conhecimento
    knowledge_objects_select.on('change', function(){
      //pega o id do objeto de conhecimento selecionado
      var knowledge_object_id = $(this).val();

      //faz a requisição das habilidades
      var abilitiesPromise = abilitiesDao.all(knowledge_object_id);

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
