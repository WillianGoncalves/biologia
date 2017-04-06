class AddTipoToQuestao < ActiveRecord::Migration[5.0]
  def change
    add_column :questoes, :tipo, :integer, default: 0
  end
end
