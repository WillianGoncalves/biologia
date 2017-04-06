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
  belongs_to :questao
end
