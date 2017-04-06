class RenameTableResposta < ActiveRecord::Migration[5.0]
  def change
    rename_table 'resposta', 'respostas'
  end
end
