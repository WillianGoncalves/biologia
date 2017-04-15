(function(){
  'use strict';

  $(document).ready(function(){
    var disciplines_select = $('#discipline_id');
    var disciplines_dao = new dao.DisciplinesDao();

    var promise = disciplines_dao.all();

    promise.done(function(data){
      utils.fillSelect(disciplines_select, data);
    });
  });
})();
