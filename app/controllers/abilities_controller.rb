class AbilitiesController < ApplicationController
  def index
    @abilities = []

    if params[:knowledge_object_id].present?
      knowledge_object = KnowledgeObject.find(params[:knowledge_object_id])
      @abilities = knowledge_object.abilities
    end

    respond_to do |format|
      format.html
      format.json { render json: @abilities }
    end
  end
end
