class RenameTables < ActiveRecord::Migration[5.0]
  def change
    rename_table 'questaos', 'questoes'
    rename_table 'grande_temas', 'grandes_temas'
    rename_table 'objeto_conhecimentos', 'objetos_conhecimento'
  end
end
