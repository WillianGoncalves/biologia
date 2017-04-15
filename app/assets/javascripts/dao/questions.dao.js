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
  }

  dao.QuestionsDao = QuestionsDao;

})();
