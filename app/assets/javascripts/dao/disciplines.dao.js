(function(){
  'use strict';

  function DisciplinesDao(){
    this.all = function all(){
      return $.get("/disciplines.json");
    };

    this.save = function save(discipline){
      $.post("/disciplines", discipline);
    };
  }

  dao.DisciplinesDao = DisciplinesDao;

})();
