(function(){
  'use strict';

  function CompetencesDao(){
    this.all = function all(){
      return $.get("/competences.json");
    };
  }

  dao.CompetencesDao = CompetencesDao;
})();
