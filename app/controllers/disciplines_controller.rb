class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all
  end

  def new
  end

  def create
  end
end
