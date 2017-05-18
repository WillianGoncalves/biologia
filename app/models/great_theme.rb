# == Schema Information
#
# Table name: great_themes
#
#  id            :integer          not null, primary key
#  description   :string
#  discipline_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_great_themes_on_discipline_id  (discipline_id)
#

class GreatTheme < ApplicationRecord
  belongs_to :discipline
  has_many :knowledge_objects, dependent: :destroy
  validates :description, presence: true
end
