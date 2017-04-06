# == Schema Information
#
# Table name: questaos
#
#  id         :integer          not null, primary key
#  enunciado  :text
#  tipo       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Questao < ApplicationRecord
  has_many :respostas
  enum tipo: [:multipla_escolha, :discursiva, :verdadeiro_falso]
  validates :enunciado, presence: true
end
