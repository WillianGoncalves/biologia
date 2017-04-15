(function(){
  'use strict';

  function GreatThemesDao(){
    this.all = function all(discipline_id){
      return $.get("/disciplines/" + discipline_id + "/great_themes.json");
    };

    this.save = function save(great_theme){
      $.post('/great_themes', great_theme);
    };
  }

  dao.GreatThemesDao = GreatThemesDao;
})();
