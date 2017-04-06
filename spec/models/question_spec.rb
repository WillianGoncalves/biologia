require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'create questions by type' do
    it 'multiple choice' do
      question = Fabricate(:multiple_choice)
      expect(question.answers.count).to eq(5)
    end

    it 'discursive' do
      question = Fabricate(:discursive)
      expect(question.answers.count).to eq(1)
    end

    it 'true or false' do
      question = Fabricate(:true_false)
      expect(question.answers.count).to eq(2)
    end
  end
end
