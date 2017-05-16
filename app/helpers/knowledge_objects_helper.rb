module KnowledgeObjectsHelper
  def great_themes_for_select
    GreatTheme.all.map{ |d| [d.description, d.id] }
  end
end
