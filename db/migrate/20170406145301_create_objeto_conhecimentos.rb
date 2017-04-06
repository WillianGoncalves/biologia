class CreateObjetoConhecimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :objeto_conhecimentos do |t|
      t.string :descricao
      t.references :grandeTema, foreign_key: true

      t.timestamps
    end
  end
end
