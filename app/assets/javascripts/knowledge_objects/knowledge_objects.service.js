(function(){
  'use strict';

  function KnowledgeObjectsService(){
    this.buildKnowledgeObject = function buildKnowledgeObject(){
      var knowledge_object = {
        description: $('#knowledge_object_description').val(),
        great_theme_id: $('#great_theme_id').val()
      };

      return {knowledge_object: knowledge_object};
    };
  }

  services.KnowledgeObjectsService = KnowledgeObjectsService;
})();
