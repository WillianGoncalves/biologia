(function(){
  'use strict';

  function KnowledgeObjectsDao(){
    this.all = function all(greatThemeId){
      return $.get("/great_themes/" + greatThemeId + "/knowledge_objects.json");
    };
  }

  dao.KnowledgeObjectsDao = KnowledgeObjectsDao;
})();
