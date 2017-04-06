# == Schema Information
#
# Table name: grande_temas
#
#  id            :integer          not null, primary key
#  descricao     :string
#  disciplina_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GrandeTema < ApplicationRecord
  self.table_name = "grandes_temas"
  belongs_to :disciplina
  has_many :objetos_conhecimento
  validates :descricao, :disciplina, presence: true
end
