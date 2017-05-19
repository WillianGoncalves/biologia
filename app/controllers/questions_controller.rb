class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render new_question_path(@question), status: 400
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit, status: 400
    end
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:statement, :question_type, :ability_id, :competence_id, answers_attributes: [:id, :text, :correct])
    end
end
