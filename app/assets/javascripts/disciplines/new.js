(function(){
  'use strict';

  $(document).ready(function(){
    var service = new services.DisciplinesService();
    var disciplineDao = new dao.DisciplinesDao();

    $('#salvar').on('click', function(){
      var discipline = service.buildDiscipline();
      disciplineDao.save(discipline);
    });
  });

})();
