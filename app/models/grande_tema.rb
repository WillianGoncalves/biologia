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
  belongs_to :disciplina
  validates :descricao, :disciplina, presence: true  
end
