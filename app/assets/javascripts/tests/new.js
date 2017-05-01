(function(){
  'use strict';

  $(document).ready(function(){

    var disciplines_select = $('#discipline_id');

    var disciplines_dao = new dao.DisciplinesDao();
    var questions_dao = new dao.QuestionsDao();
    var service = new services.TestsService();

    var disciplines_promise = disciplines_dao.all();
    disciplines_promise.done(function(data){
      utils.fillSelect(disciplines_select, data);
    });

    $('#generate').on('click', function(){
      $('#questions_container').empty();

      var questions_promise = questions_dao.questionsByDiscipline(disciplines_select.val());
      var questions_number = $('#questions_number').val();

      questions_promise.done(function(data){
        var questions = [];

        while (questions.length < questions_number) {
          var contains_question = false;
          var item = data[Math.floor(Math.random()*data.length)];

          for (var i = 0; i < questions.length; i++) {
            if (questions[i] == item) {
              contains_question = true;
              break;
            }
          }

          if (!contains_question) questions.push(item);
        }

        service.createTest(questions);
      });
    });

  });
})();
