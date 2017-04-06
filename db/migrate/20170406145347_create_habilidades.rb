class CreateHabilidades < ActiveRecord::Migration[5.0]
  def change
    create_table :habilidades do |t|
      t.text :descricao
      t.references :objetoConhecimento, foreign_key: true

      t.timestamps
    end
  end
end
