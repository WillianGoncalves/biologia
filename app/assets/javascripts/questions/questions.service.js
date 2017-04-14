(function(services){
  'use strict';

  function QuestionsService($){

    var answersCount = 0;

    this.addAnswer = function addAnswer(answer){
      //pega o template na view
      var template = document.querySelector('#answer_template');

      //seta o conteúdo da resposta no template
      var p = template.content.querySelector('p');
      p.innerText = answer;

      // var input = template.content.querySelector('input[type=text]');
      // $(input).val(answer);

      //seta o índice do botão de exclusão da resposta
      //esse índice é usado para identificar qual resposta está sendo processada
      var button = template.content.querySelector('button');
      var buttonIndex = answersCount + 1;
      $(button).attr('data-index', buttonIndex);

      //cria um elemento baseado no template
      var clone = document.importNode(template.content, true);

      //adiciona o clone na lista de respostas
      $('#answers').append(clone);

      answersCount++;
    };

    //exclui uma resposta
    this.removeAnswer = function removeAnswer(index){
      //remove a resposta da lista
      $('#answers').children().eq(index).remove();
      answersCount--;
      resetRemoveButtonsIndexes();
    };

    //reseta o index dos botões de exclusão de resposta
    var resetRemoveButtonsIndexes = function resetRemoveButtonsIndexes(){
      //pega todos os botões de exclusão na lista de respostas
      var buttons = $('#answers').find('button');

      //seta o índice de cada botão
      for(var i = 0; i < buttons.length; i++){
        var button = buttons[i];
        $(button).attr('data-index', i+1);
      }
    };

    this.buildQuestion = function buildQuestion(){
      //cria um array de answers
      var answers = [];

      //pega as divs com as respostas
      var answersDivs = $('#answers').find('.input-group');

      //faz a iteração entre as divs
      for(var i = 0; i < answersDivs.length; i++){
        var answerDiv = answersDivs[i];

        //cria uma resposta
        var answer = {
          text: $(answerDiv).find('p').text(),
          correct: $(answerDiv).find('input').is(':checked')
        };

        answers.push(answer);
      }

      //cria a questão
      var question = {
        statement: $('#question_statement').val(),
        question_type: $('#question_question_type').val(),
        ability_id: $('#ability').val(),
        answers_attributes: answers
      };

      return question;
    };

  }

  services.QuestionsService = QuestionsService;

})(services);
