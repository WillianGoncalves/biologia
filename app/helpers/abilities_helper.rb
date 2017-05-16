module AbilitiesHelper
  def knowledge_objects_for_select
    KnowledgeObject.all.map{ |k| [k.description, k.id] }
  end
end
