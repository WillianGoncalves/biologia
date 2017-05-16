(function(){
  'use strict';

  function GreatThemesDao(){
    this.all = function all(discipline_id){
      return $.get("/disciplines/" + discipline_id + "/great_themes.json");
    };
  }

  dao.GreatThemesDao = GreatThemesDao;
})();
