(function(services, dao){
  'use strict';

  $(document).ready(function(){

    var questions_dao = new dao.QuestionsDao();
    var competences_dao = new dao.CompetencesDao();
    var disciplines_dao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();
    var knowledge_objects_dao = new dao.KnowledgeObjectsDao();
    var abilities_dao = new dao.AbilitiesDao();

    //armazena os selects em variáveis
    var disciplines_select = $('#discipline');
    var great_theme_select = $('#great_theme');
    var knowledge_objects_select = $('#knowledge_object');
    var abilities_select = $('#question_ability_id');
    var competences_select = $('#competence');

    //faz a requisição das competências
    var competences_promise = competences_dao.all();

    competences_promise.done(function(data){
      utils.fillSelect(competences_select, data);
    });

    //faz a requisição das disciplinas
    var disciplines_promise = disciplines_dao.all();

    disciplines_promise.done(function(data){
      utils.fillSelect(disciplines_select, data);
    });

    //implementa o evento "onChange" do select de disciplinas
    disciplines_select.on('change', function(){
      //pega o id da disciplina selecionada
      var discipline_id = $(this).val();

      //faz a requisição dos grandes temas
      var great_themes_promise = great_themes_dao.all(discipline_id);

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
      abilities_select.empty();

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
      var abilities_promise = abilities_dao.all(knowledge_object_id);

      //limpa o select de habilidades
      abilities_select.empty();

      //carrega as habilidades
      abilities_promise.done(function(data){
        utils.fillSelect(abilities_select, data);
      });
    });

  });

})(services, dao);
