(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var greatThemesSelect = $('#great_theme_id');
    var knowledgeObjectsSelect = $('#knowledge_object_id');

    var disciplinesDao = new dao.DisciplinesDao();
    var greatThemesDao = new dao.GreatThemesDao();
    var knowledgeObjectsDao = new dao.KnowledgeObjectsDao();    

    var disciplinesPromise = disciplinesDao.all();

    disciplinesPromise.done(function(data){
      utils.fillSelect(disciplinesSelect, data);
    });

    disciplinesSelect.on('change', function(){
      var disciplineId = $(this).val();

      var greatThemesPromise = greatThemesDao.all(disciplineId);

      greatThemesPromise.done(function(data){
        utils.fillSelect(greatThemesSelect, data);
      });
    });

    greatThemesSelect.on('change', function(){
      var greatThemeId = $(this).val();

      var knowledgeObjectsPromise = knowledgeObjectsDao.all(greatThemeId);

      knowledgeObjectsPromise.done(function(data){
        utils.fillSelect(knowledgeObjectsSelect, data);
      });
    });
  });
})();
