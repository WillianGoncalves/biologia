# == Schema Information
#
# Table name: habilidades
#
#  id                    :integer          not null, primary key
#  descricao             :text
#  objetoConhecimento_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Habilidade < ApplicationRecord
  belongs_to :objetoConhecimento
  validates :descricao, :objetoConhecimento, presence: true  
end
