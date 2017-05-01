(function(){
  'use strict';

  function QuestionsDao(){
    this.save = function save(question){
      $.post("/questions", question);
    };

    this.remove = function remove(questionId){
      $.ajax({
        url: "/questions/" + questionId,
        method: "delete"
      });
    };

    this.questionsByDiscipline = function questionsByDiscipline(discipline_id){
      return $.get("/questions_by_discipline/" + discipline_id + ".json");
    };
  }

  dao.QuestionsDao = QuestionsDao;

})();
