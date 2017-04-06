# == Schema Information
#
# Table name: questaos
#
#  id         :integer          not null, primary key
#  enunciado  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Questao < ApplicationRecord
  has_many :respostas
  validates :enunciado, presence: true  
end
