class TableFromPtToEn < ActiveRecord::Migration[5.0]
  def change
    rename_table "disciplinas", "disciplines"
    rename_table "grandes_temas", "great_themes"
    rename_table "habilidades", "abilities"
    rename_table "objetos_conhecimento", "knowledge_objects"
    rename_table "questoes", "questions"
    rename_table "respostas", "answers"

    rename_column "disciplines", "descricao", "description"
    rename_column "great_themes", "descricao", "description"
    rename_column "great_themes", "disciplina_id", "discipline_id"
    rename_column "abilities", "descricao", "description"
    rename_column "abilities", "objetoConhecimento_id", "knowledge_object_id"
    rename_column "knowledge_objects", "descricao", "description"
    rename_column "knowledge_objects", "grandeTema_id", "great_theme_id"
    rename_column "questions", "enunciado", "statement"
    rename_column "questions", "tipo", "question_type"
    rename_column "answers", "texto", "text"
    rename_column "answers", "correta", "correct"
  end
end
