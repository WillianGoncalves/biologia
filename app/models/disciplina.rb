# == Schema Information
#
# Table name: disciplinas
#
#  id         :integer          not null, primary key
#  descricao  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Disciplina < ApplicationRecord
  has_many :grandes_temas
  validates :descricao, presence: true
end
