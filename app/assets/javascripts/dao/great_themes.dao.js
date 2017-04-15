(function(){
  'use strict';

  function GreatThemesDao(){
    this.all = function all(disciplineId){
      return $.get("/disciplines/" + disciplineId + "/great_themes.json");
    };
  }

  dao.GreatThemesDao = GreatThemesDao;
})();
