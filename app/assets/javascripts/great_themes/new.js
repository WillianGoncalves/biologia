(function(){
  'use strict';

  $(document).ready(function(){
    var service = new services.GreatThemesService();
    var greatThemesDao = new dao.GreatThemesDao();

    var disciplinesSelect = $('#discipline_id');
    var disciplinesDao = new dao.DisciplinesDao();

    var promise = disciplinesDao.all();

    promise.done(function(data){
      utils.fillSelect(disciplinesSelect, data);
    });

    $('#salvar').on('click', function(){
      var greatTheme = service.buildGreatTheme();
      greatThemesDao.save(greatTheme);
    });
  });
})();
