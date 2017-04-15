(function(){
  'use strict';

  $(document).ready(function(){
    var service = new services.GreatThemesService();
    var great_themes_dao = new dao.GreatThemesDao();

    var disciplines_select = $('#discipline_id');
    var disciplines_dao = new dao.DisciplinesDao();

    var promise = disciplines_dao.all();

    promise.done(function(data){
      utils.fillSelect(disciplines_select, data);
    });

    $('#salvar').on('click', function(){
      var great_theme = service.buildGreatTheme();
      great_themes_dao.save(great_theme);
    });
  });
})();
