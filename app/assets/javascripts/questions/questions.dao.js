(function(dao){
  'use strict';

  function QuestionsDao($){
    this.getDisciplines = function getDisciplines(){
      return $.get("/disciplines.json");
    };

    this.getGreatThemes = function getGreatThemes(disciplineId){
      return $.get("/disciplines/" + disciplineId + "/great_themes.json");
    };

    this.getKnowledgeObjects = function getKnowledgeObjects(greatThemeId){
      return $.get("/great_themes/" + greatThemeId + "/knowledge_objects.json");
    };

    this.getAbilities = function getAbilities(knowledgeObjectId){
      return $.get("/knowledge_objects/" + knowledgeObjectId + "/abilities.json");
    };

    this.getCompetences = function getCompetences(){
      return $.get("/competences");
    };

    this.save = function save(question){
      $.post("/questions", question);
    };

    this.remove = function remove(questionId){
      $.ajax({
        url: "/questions/" + questionId,
        method: "delete"
      });
    };
  }

  dao.QuestionsDao = QuestionsDao;

})(dao);
