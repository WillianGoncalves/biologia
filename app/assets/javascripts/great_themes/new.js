(function(){
  'use strict';

  $(document).ready(function(){
    var service = new services.GreatThemesService();
    var great_themes_dao = new dao.GreatThemesDao();

    var disciplinesSelect = $('#discipline_id');
    var disciplinesDao = new dao.DisciplinesDao();

    var promise = disciplinesDao.all();

    promise.done(function(data){
      utils.fillSelect(disciplinesSelect, data);
    });

    $('#salvar').on('click', function(){
      var great_theme = service.buildGreatTheme();
      great_themes_dao.save(great_theme);
    });
  });
})();
