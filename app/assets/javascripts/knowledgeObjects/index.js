(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var greatThemesSelect = $('#great_theme_id');

    var disciplinesDao = new dao.DisciplinesDao();
    var greatThemesDao = new dao.GreatThemesDao();

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
  });
})();
