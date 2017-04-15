(function(){
  'use strict';

  function GreatThemesDao(){
    this.all = function all(disciplineId){
      return $.get("/disciplines/" + disciplineId + "/great_themes.json");
    };

    this.save = function save(great_theme){
      $.post('/great_themes', great_theme);
    };
  }

  dao.GreatThemesDao = GreatThemesDao;
})();
