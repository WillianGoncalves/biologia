(function(){
  'use strict';

  function DisciplinesDao(){
    this.all = function all(){
      return $.get("/disciplines.json");
    };
  }

  dao.DisciplinesDao = DisciplinesDao;

})();
