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

  def new
    @great_theme = GreatTheme.new
  end

  def create
    @great_theme = GreatTheme.new(great_theme_params)
    if @great_theme.save
      redirect_to great_themes_path, status: 200
    else
      render new_great_theme_path(@great_theme), status: 400
    end
  end

  private
    def great_theme_params
      params.require(:great_theme).permit(:description, :discipline_id)
    end
end
