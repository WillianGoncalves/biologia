class GreatThemesController < ApplicationController
  def index
    discipline = Discipline.find(params[:discipline_id])
    @great_themes = discipline.great_themes.all
    render json: @great_themes
  end
end
