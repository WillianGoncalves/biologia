class TestsController < ApplicationController

  def index
  end

  def new
    @questions_number = Question.count
  end

  def generate
    render new_test_path unless params[:discipline].present? && params[:questions_number].present?
    questions = Question.joins(:ability => [:knowledge_object => [:great_theme => [:discipline]]]).where("disciplines.id = ?", params[:discipline])
    @questions = question.sample(params[:questions_number])
  end

end
