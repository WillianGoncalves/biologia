(function(){
  'use strict';

  function DisciplinesService(){
    this.buildDiscipline = function buildDiscipline(){
      var discipline = {
        description: $('#discipline_description').val()
      };

      return {discipline: discipline};
    };
  }

  services.DisciplinesService = DisciplinesService;
})();
