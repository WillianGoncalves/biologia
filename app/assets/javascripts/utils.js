var utils = (function() {
  'use strict';

  function fillSelect(select, elements) {
    select.empty();
    
    var defaultOption = $("<option></option>").attr("disabled", "disabled").attr("selected", "selected").text("-- Selecione uma opção --");
    select.append(defaultOption);

    $.each(elements, function(key, value) {

      //por padrão, os objetos no banco de dados possuem as propriedades
      //"id" e "descricao", que são usadas para criar os options.
      var option = $("<option></option>").attr("value", value.id).text(value.description);

      select.append(option);
    });
  }

  return {
    fillSelect: fillSelect
  };

})();
