class RenameQuestaoIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column "answers", "questao_id", "question_id"
  end
end
