(function(){
  'use strict';

  function TestsService(){
    this.createTest = function createTest(questions){

      for (var i = 0; i < questions.length; i++) {
        var question = questions[i];
        var question_template = document.querySelector('#question_template');

        var statement = question_template.content.querySelector('p');
        statement.innerText = question.statement;

        var answers_container = question_template.content.querySelector('.list-group');
        $(answers_container).empty();

        var answer_template = document.querySelector('#answer_template');
        var answer_text = answer_template.content.querySelector('.list-group-item');

        for (var j = 0; j < question.answers.length; j++) {
          var answer = question.answers[j];
          $(answer_text).text(answer.text);
          var answer_clone = document.importNode(answer_template.content, true);
          $(answers_container).append(answer_clone);
        }

        var question_clone = document.importNode(question_template.content, true);
        $('#questions_container').append(question_clone);
      }

    };
  }

  services.TestsService = TestsService;
})();
