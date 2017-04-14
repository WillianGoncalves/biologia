(function(){
  'use strict';

  $(document).ready(function(){
    var questionDao = new dao.QuestionsDao($);

    $('#questions').on('click', 'button', function(){

      var questionId = $(this).data('question-id');

      if ($(this).hasClass('btn-danger')) {
        questionDao.remove(questionId);
      }

    });

  });

})();
