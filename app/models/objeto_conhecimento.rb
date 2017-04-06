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
  belongs_to :grandeTema
end
