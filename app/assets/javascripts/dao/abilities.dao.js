(function(){
  'use strict';

  function AbilitiesDao(){
    this.all = function all(knowledgeObjectId){
      return $.get("/knowledge_objects/" + knowledgeObjectId + "/abilities.json");
    };
  }

  dao.AbilitiesDao = AbilitiesDao;
})();
