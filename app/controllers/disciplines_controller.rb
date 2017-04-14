class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.create(discipline_params)
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
