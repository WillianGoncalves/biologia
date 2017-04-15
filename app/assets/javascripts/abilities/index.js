(function(){
  'use strict';

  $(document).ready(function(){
    var disciplines_select = $('#discipline_id');
    var great_theme_select = $('#great_theme_id');
    var knowledge_objects_select = $('#knowledge_object_id');

    var disciplines_dao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();
    var knowledge_objects_dao = new dao.KnowledgeObjectsDao();    

    var disciplines_promise = disciplines_dao.all();

    disciplines_promise.done(function(data){
      utils.fillSelect(disciplines_select, data);
    });

    disciplines_select.on('change', function(){
      var discipline_id = $(this).val();

      var great_themes_promise = great_themes_dao.all(discipline_id);

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
