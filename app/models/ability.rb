# == Schema Information
#
# Table name: abilities
#
#  id                  :integer          not null, primary key
#  description         :text
#  knowledge_object_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_abilities_on_knowledge_object_id  (knowledge_object_id)
#

class Ability < ApplicationRecord
  belongs_to :knowledge_object
  validates :description, :knowledge_object, presence: true
end
