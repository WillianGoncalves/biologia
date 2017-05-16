class KnowledgeObjectsController < ApplicationController
  before_action :load_great_theme, only: [:index]

  def index
    @knowledge_objects = @great_theme&.knowledge_objects || KnowledgeObject.all

    respond_to do |format|
      format.html
      format.json { render json: @knowledge_objects }
    end
  end

  def show
    @knowledge_object = KnowledgeObject.find(params[:id])
  end

  def new
    @knowledge_object = KnowledgeObject.new
  end

  def create
    @knowledge_object = KnowledgeObject.new(knowledge_object_params)
    if @knowledge_object.save
      redirect_to knowledge_objects_path
    else
      render new_knowledge_object_path(@knowledge_object), status: 400
    end
  end

  def edit
    @knowledge_object = KnowledgeObject.find(params[:id])
  end

  def update
    @knowledge_object = KnowledgeObject.find(params[:id])
    if @knowledge_object.update(knowledge_object_params)
      redirect_to knowledge_objects_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    @knowledge_object = KnowledgeObject.destroy(params[:id])
    redirect_to knowledge_objects_path
  end

  private

  def knowledge_object_params
    params.require(:knowledge_object).permit(:description, :great_theme_id)
  end

  def load_great_theme
    @great_theme = GreatTheme.find(params[:great_theme_id]) if params[:great_theme_id].present?
  end
end
