class CreateResposta < ActiveRecord::Migration[5.0]
  def change
    create_table :resposta do |t|
      t.text :texto
      t.boolean :correta
      t.references :questao, foreign_key: true

      t.timestamps
    end
  end
end
