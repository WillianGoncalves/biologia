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

  private
    def question_params
      params.require(:question).permit(:statement, :question_type, :ability_id, :competence_id, answers_attributes: [:text, :correct])
    end
end
