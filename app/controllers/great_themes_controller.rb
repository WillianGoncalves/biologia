class GreatThemesController < ApplicationController
  def index
    @great_themes = []
    if params[:discipline_id].present?
      discipline = Discipline.find(params[:discipline_id])
      @great_themes = discipline.great_themes.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @great_themes}
    end
  end
end
