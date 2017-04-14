class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def create
  end
end
