# == Schema Information
#
# Table name: resposta
#
#  id         :integer          not null, primary key
#  texto      :text
#  correta    :boolean
#  questao_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resposta < ApplicationRecord
  self.table_name = "respostas"
  belongs_to :questao
  validates :texto, :questao, presence: true
end
