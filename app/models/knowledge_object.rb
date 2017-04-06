# == Schema Information
#
# Table name: knowledge_objects
#
#  id             :integer          not null, primary key
#  description    :string
#  great_theme_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_knowledge_objects_on_great_theme_id  (great_theme_id)
#

class KnowledgeObject < ApplicationRecord
  belongs_to :great_theme
  has_many :abilities
  validates :description, :great_theme, presence: true
end
