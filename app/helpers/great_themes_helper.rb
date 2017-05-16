module GreatThemesHelper
  def disciplines_for_select
    Discipline.all.map{|d| [d.description, d.id]}
  end
end
