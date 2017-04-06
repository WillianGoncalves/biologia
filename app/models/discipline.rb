# == Schema Information
#
# Table name: disciplines
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Discipline < ApplicationRecord
  has_many :great_themes
  validates :description, presence: true
end
