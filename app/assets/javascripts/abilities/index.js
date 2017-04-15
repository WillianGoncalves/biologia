(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var great_theme_select = $('#great_theme_id');
    var knowledge_objects_select = $('#knowledge_object_id');

    var disciplinesDao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();
    var knowledge_objects_dao = new dao.KnowledgeObjectsDao();    

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

    great_theme_select.on('change', function(){
      var great_theme_id = $(this).val();

      var knowledge_objects_promise = knowledge_objects_dao.all(great_theme_id);

      knowledge_objects_promise.done(function(data){
        utils.fillSelect(knowledge_objects_select, data);
      });
    });
  });
})();
