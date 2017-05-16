class GreatThemesController < ApplicationController
  before_action :load_discipline, only: [:create]

  def index
    @great_themes = @discipline&.great_themes || GreatTheme.all

    respond_to do |format|
      format.html
      format.json { render json: @great_themes}
    end
  end

  def show
    @great_theme = GreatTheme.find(params[:id])
  end

  def new
    @great_theme = GreatTheme.new
  end

  def create
    @great_theme = GreatTheme.new(great_theme_params)
    if @great_theme.save
      redirect_to great_themes_path
    else
      render :new, status: 400
    end
  end

  def edit
    @great_theme = GreatTheme.find(params[:id])
  end

  def update
    @great_theme = GreatTheme.find(params[:id])
    if @great_theme.update(great_theme_params)
      redirect_to great_themes_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    @great_theme = GreatTheme.destroy(params[:id])
    redirect_to great_themes_path
  end

  private

  def great_theme_params
    params.require(:great_theme).permit(:description, :discipline_id)
  end

  def load_discipline
    @discipline = Discipline.find(params[:discipline_id]) if params[:discipline_id].present?
  end
end
