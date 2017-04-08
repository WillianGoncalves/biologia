class AbilitiesController < ApplicationController
  def index
    knowledge_object = KnowledgeObject.find(params[:knowledge_object_id])
    @abilities = knowledge_object.abilities
    render json: @abilities
  end
end
