(function(){
  'use strict';

  function DisciplinesDao(){
    this.save = function save(discipline){
      $.post("/disciplines", discipline);
    };
  }

  dao.DisciplinesDao = DisciplinesDao;

})();
