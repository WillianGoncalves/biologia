(function(){
  'use strict';

  function GreatThemesService(){
    this.buildGreatTheme = function buildGreatTheme(){
      var great_theme = {
        description: $('#great_theme_description').val(),
        discipline_id: $('#discipline_id').val()
      };

      return {great_theme: great_theme};
    };    
  }

  services.GreatThemesService = GreatThemesService;
})();
