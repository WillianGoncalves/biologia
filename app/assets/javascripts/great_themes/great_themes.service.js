(function(){
  'use strict';

  function GreatThemesService(){
    this.buildGreatTheme = function buildGreatTheme(){
      var greatTheme = {
        description: $('#great_theme_description').val(),
        discipline_id: $('#discipline_id').val()
      };

      return {greatTheme: greatTheme};
    };    
  }

  services.GreatThemesService = GreatThemesService;
})();
