class CompetencesController < ApplicationController
  def index
    @competences = Competence.all

    respond_to do |format|
      format.html
      format.json { render json: @competences }
    end
  end

  def show
    @competence = Competence.find(params[:id])
  end

  def new
    @competence = Competence.new
  end

  def create
    @competence = Competence.new(competence_params)
    if @competence.save
      redirect_to competences_path
    else
      render :new, status: 400
    end
  end

  def edit
    @competence = Competence.find(params[:id])
  end

  def update
    @competence = Competence.find(params[:id])
    if @competence.update(competence_params)
      redirect_to competences_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    @competence = Competence.destroy(params[:id])
    redirect_to competences_path
  end

  private

  def competence_params
    params.require(:competence).permit(:description)
  end
end
