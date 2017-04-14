class AddCompetenceToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :competence
  end
end
