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

  def new
    @knowledge_object = KnowledgeObject.new
  end

  def create
    @knowledge_object = KnowledgeObject.new(knowledge_object_params)
    if @knowledge_object.save
      redirect_to knowledge_objects_path, status: 200
    else
      render new_knowledge_object_path(@knowledge_object), status: 400
    end
  end

  private
    def knowledge_object_params
      params.require(:knowledge_object).permit(:description, :great_theme_id)
    end
end
