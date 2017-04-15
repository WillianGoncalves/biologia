(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var great_theme_select = $('#great_theme_id');

    var disciplinesDao = new dao.DisciplinesDao();
    var great_themes_dao = new dao.GreatThemesDao();

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
  });
})();
