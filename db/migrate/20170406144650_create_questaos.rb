class CreateQuestaos < ActiveRecord::Migration[5.0]
  def change
    create_table :questaos do |t|
      t.text :enunciado

      t.timestamps
    end
  end
end
