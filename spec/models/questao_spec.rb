require 'rails_helper'

RSpec.describe Questao, type: :model do
  context 'create questions by type' do
    it 'multipla escolha' do
      questao = Fabricate(:multipla_escolha)
      expect(questao.respostas.count).to eq(5)
    end

    it 'discursiva' do
      questao = Fabricate(:discursiva)
      expect(questao.respostas.count).to eq(1)
    end

    it 'verdadeiro falso' do
      questao = Fabricate(:verdadeiro_falso)
      expect(questao.respostas.count).to eq(2)
    end
  end
end
