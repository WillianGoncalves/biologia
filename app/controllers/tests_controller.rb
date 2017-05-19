class TestsController < ApplicationController

  def index
    @questions = []
    @max_questions = Question.count

    if params[:discipline_id].present?
      @questions = Question.joins(:ability => [:knowledge_object => [:great_theme => [:discipline]]]).where("disciplines.id = ?", params[:discipline_id])

      if params[:questions_number].present? && params[:questions_number].to_i <= @max_questions
        @questions = @questions.sample(params[:questions_number].to_i)
      end
    end
  end

end
