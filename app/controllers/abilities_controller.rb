class AbilitiesController < ApplicationController
  before_action :load_knowledge_object

  def index
    @abilities = @knowledge_object.abilities

    respond_to do |format|
      format.html
      format.json { render json: @abilities }
    end
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = @knowledge_object.abilities.new(ability_params)
    if @ability.save
      redirect_to knowledge_object_abilities_path
    else
      render :new, status: 400
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      redirect_to knowledge_object_abilities_path
    else
      render :edit, status: 400
    end
  end

  private

  def ability_params
    params.require(:ability).permit(:description)
  end

  def load_knowledge_object
    @knowledge_object = KnowledgeObject.find(params[:knowledge_object_id])
  end
end
