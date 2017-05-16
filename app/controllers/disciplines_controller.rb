class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all

    respond_to do |format|
      format.html
      format.json { render json: @disciplines }
    end
  end

  def show
    @discipline = Discipline.find(params[:id])
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(discipline_params)
    if @discipline.save
      redirect_to disciplines_path
    else
      render :new, status: 400
    end
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id])
    if @discipline.update(discipline_params)
      redirect_to disciplines_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    Discipline.destroy(params[:id])
    redirect_to disciplines_path
  end

  private
    def discipline_params
      params.require(:discipline).permit(:description)
    end
end
