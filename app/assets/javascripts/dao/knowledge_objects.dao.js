(function(){
  'use strict';

  function KnowledgeObjectsDao(){
    this.all = function all(great_theme_id){
      return $.get("/great_themes/" + great_theme_id + "/knowledge_objects.json");
    };
  }

  dao.KnowledgeObjectsDao = KnowledgeObjectsDao;
})();
