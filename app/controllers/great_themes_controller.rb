class GreatThemesController < ApplicationController
  def index
    @great_themes = GreatTheme.all
    render json: @great_themes
  end
end
