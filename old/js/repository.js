(function(DAO){
  'use strict';

  var data = DATABASE.getData();
  var grandeTema;
  var objConhecimento;

  DAO.getGrandesTemas = function(){
    return data.grandesTemas;
  };

  DAO.getObjetosConhecimento = function(idGrandeTema){
    for(var i = 0; i < data.grandesTemas.length; i++){
      if(data.grandesTemas[i].id == idGrandeTema){
        this.grandeTema = data.grandesTemas[i];
        return this.grandeTema.objetosConhecimento;
      }
    }
  };

  DAO.getHabilidades = function(idObjConhecimento){
    for(var i = 0; i < this.grandeTema.objetosConhecimento.length; i++){
      if(this.grandeTema.objetosConhecimento[i].id == idObjConhecimento){
        this.objConhecimento = this.grandeTema.objetosConhecimento[i];
        return this.objConhecimento.habilidades;
      }
    }
  };

})(window.DAO = window.DAO || {});
