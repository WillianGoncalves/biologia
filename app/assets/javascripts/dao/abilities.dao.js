(function(){
  'use strict';

  function AbilitiesDao(){
    this.all = function all(knowledge_object_id){
      return $.get("/knowledge_objects/" + knowledge_object_id + "/abilities.json");
    };
  }

  dao.AbilitiesDao = AbilitiesDao;
})();
