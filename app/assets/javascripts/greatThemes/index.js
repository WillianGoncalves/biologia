(function(){
  'use strict';

  $(document).ready(function(){
    var disciplinesSelect = $('#discipline_id');
    var disciplinesDao = new dao.DisciplinesDao();

    var promise = disciplinesDao.all();

    promise.done(function(data){
      utils.fillSelect(disciplinesSelect, data);
    });
  });
})();
