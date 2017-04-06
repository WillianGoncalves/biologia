class CreateGrandeTemas < ActiveRecord::Migration[5.0]
  def change
    create_table :grande_temas do |t|
      t.string :descricao
      t.references :disciplina, foreign_key: true

      t.timestamps
    end
  end
end
