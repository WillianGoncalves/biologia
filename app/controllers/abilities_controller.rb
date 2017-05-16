class AbilitiesController < ApplicationController
  before_action :load_knowledge_object, only: [:index]

  def index
    @abilities = @knowledge_object&.abilities || Ability.all

    respond_to do |format|
      format.html
      format.json { render json: @abilities }
    end
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(ability_params)
    if @ability.save
      redirect_to abilities_path
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
      redirect_to abilities_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    @ability = Ability.destroy(params[:id])
    redirect_to abilities_path
  end

  private

  def ability_params
    params.require(:ability).permit(:description, :knowledge_object_id)
  end

  def load_knowledge_object
    @knowledge_object = KnowledgeObject.find(params[:knowledge_object_id]) if params[:knowledge_object_id].present?
  end
end
