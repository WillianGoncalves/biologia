class KnowledgeObjectsController < ApplicationController
  def index
    great_theme = GreatTheme.find(params[:great_theme_id])
    @knowledge_objects = great_theme.knowledge_objects
    render json: @knowledge_objects
  end
end
