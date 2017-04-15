class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all

    respond_to do |format|
      format.html
      format.json { render json: @disciplines }
    end
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(discipline_params)
    if @discipline.save
      redirect_to disciplines_path, status: 200
    else
      render new_discipline_path(@discipline), status: 400
    end
  end

  private
    def discipline_params
      params.require(:discipline).permit(:description)
    end
end
