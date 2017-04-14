(function(dao){
  'use strict';

  function QuestionsDao($){
    this.getDisciplines = function getDisciplines(){
      return $.get("/disciplines");
    };

    this.getGreatThemes = function getGreatThemes(disciplineId){
      return $.get("/disciplines/" + disciplineId + "/great_themes");
    };

    this.getKnowledgeObjects = function getKnowledgeObjects(greatThemeId){
      return $.get("/great_themes/" + greatThemeId + "/knowledge_objects");
    };

    this.getAbilities = function getAbilities(knowledgeObjectId){
      return $.get("/knowledge_objects/" + knowledgeObjectId + "/abilities");
    };

    this.getCompetences = function getCompetences(){
      return $.get("/competences");
    };

    this.save = function save(question){
      $.post("/questions", question);
    };
  }

  dao.QuestionsDao = QuestionsDao;

})(dao);
