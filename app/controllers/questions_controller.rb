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
      render :index, status: 200
    else
      render new_question_path(@question), status: 404
    end
  end

  private
    def question_params
      params.require(:question).permit(:statement, :question_type, :ability_id, :competence_id, answers_attributes: [:text, :correct])
    end
end
