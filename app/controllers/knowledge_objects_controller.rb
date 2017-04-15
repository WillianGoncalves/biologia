class KnowledgeObjectsController < ApplicationController
  def index
    @knowledge_objects = []
    if params[:great_theme_id].present?
      great_theme = GreatTheme.find(params[:great_theme_id])
      @knowledge_objects = great_theme.knowledge_objects
    end

    respond_to do |format|
      format.html
      format.json { render json: @knowledge_objects }
    end
  end
end
