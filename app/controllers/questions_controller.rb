class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, status: 200
    else
      render new_question_path(@question), status: 400
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    Question.delete(params[:id])
    redirect_to questions_path, status: 200
  end

  def questions_by_discipline
    @questions = Question.joins(:ability => [:knowledge_object => [:great_theme => [:discipline]]]).where("disciplines.id = ?", params[:discipline_id])

    respond_to do |format|
      format.json { render json: @questions.to_json(include: :answers) }
    end
  end

  private
    def question_params
      params.require(:question).permit(:statement, :question_type, :ability_id, :competence_id, answers_attributes: [:text, :correct])
    end
end
