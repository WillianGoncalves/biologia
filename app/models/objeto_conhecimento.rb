# == Schema Information
#
# Table name: objeto_conhecimentos
#
#  id            :integer          not null, primary key
#  descricao     :string
#  grandeTema_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ObjetoConhecimento < ApplicationRecord
  self.table_name = "objetos_conhecimento"
  belongs_to :grandeTema
  has_many :habilidades
  validates :descricao, :grandeTema, presence: true
end
