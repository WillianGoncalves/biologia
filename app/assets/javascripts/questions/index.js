(function(){
  'use strict';

  $(document).ready(function(){
    var questions_dao = new dao.QuestionsDao($);

    $('#questions').on('click', 'button', function(){

      var questionId = $(this).data('question-id');

      if ($(this).hasClass('btn-danger')) {
        questions_dao.remove(questionId);
      }

    });

  });

})();
