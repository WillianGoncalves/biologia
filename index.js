(function() {
  'use strict';

  $(document).ready(function() {

    //armazena os selects em variáveis
    var selectTemas = $("#grandesTemas");
    var selectObjsConhecimento = $("#objetosConhecimento");
    var selectHabilidades = $("#habilidades");

    //carrega os grandes temas
    var grandesTemas = DAO.getGrandesTemas();

    //preenche o combobox de grandes temas
    UTILS.fillSelect(selectTemas, grandesTemas);


    //evento "onchange" do select de temas
    selectTemas.on("change", function() {
      //carrega os objetos de conhecimento passando o id do tema selecionado
      var objetosConhecimento = DAO.getObjetosConhecimento(this.value);

      //remove os elementos do select de objetos do conhecimento
      selectObjsConhecimento.empty();

      //remove os elementos do select de habilidades
      selectHabilidades.empty();
      
      //preenche o select
      UTILS.fillSelect(selectObjsConhecimento, objetosConhecimento);
    });

    //evento "onchange" do select de objetos do conhecimento
    selectObjsConhecimento.on("change", function(){
      //carrega as habilidades passando o id do objeto do conhecimento selecionado
      var habilidades = DAO.getHabilidades(this.value);

      //remove os elementos do select de habilidades
      selectHabilidades.empty();

      //preenche o select
      UTILS.fillSelect(selectHabilidades, habilidades);
    });

  });
})();
