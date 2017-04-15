(function(){
  'use strict';

  function GreatThemesDao(){
    this.all = function all(disciplineId){
      return $.get("/disciplines/" + disciplineId + "/great_themes.json");
    };

    this.save = function save(greatTheme){
      $.post('/great_themes', greatTheme);
    };
  }

  dao.GreatThemesDao = GreatThemesDao;
})();
