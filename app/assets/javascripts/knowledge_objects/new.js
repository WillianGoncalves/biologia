(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var great_theme_select = $('#great_theme_id');

    var service = new services.KnowledgeObjectsService();

    var disciplinesDao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();
    var knowledge_object_dao = new dao.KnowledgeObjectsDao();

    var disciplinesPromise = disciplinesDao.all();

    disciplinesPromise.done(function(data){
      utils.fillSelect(disciplinesSelect, data);
    });

    disciplinesSelect.on('change', function(){
      var disciplineId = $(this).val();

      var great_themes_promise = great_themes_dao.all(disciplineId);

      great_themes_promise.done(function(data){
        utils.fillSelect(great_theme_select, data);
      });
    });

    $('#salvar').on('click', function(){
      var knowledge_object = service.buildKnowledgeObject();
      knowledge_object_dao.save(knowledge_object);
    });
  });
})();
