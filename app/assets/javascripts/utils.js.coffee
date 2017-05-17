window = exports ? this
window.utils = do ->

  fillSelect = (select, elements) ->
    select.empty()

    defaultOption = $("<option></option>").attr("disabled", "disabled").attr("selected", "selected").text("-- Selecione uma opção --")
    select.append defaultOption

    $.each elements, (key, value) ->
      option = $("<option></option>").attr("value", value.id).text(value.description);
      select.append option

  'use strict'
  { fillSelect: fillSelect }
