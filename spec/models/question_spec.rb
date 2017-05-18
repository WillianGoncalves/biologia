require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'valid questions' do
    it 'multiple choice' do
      question = Fabricate.build (:multiple_choice)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(5)
      expect(Question.count).to eq(1)
    end

    it 'discursive' do
      question = Fabricate.build (:discursive)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(1)
      expect(Question.count).to eq(1)
    end

    it 'true or false' do
      question = Fabricate.build (:true_false)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(2)
      expect(Question.count).to eq(1)
    end
  end

  context 'invalid data' do
    it 'does not create question' do
      question = Question.new(statement: Faker::Lorem.sentence, question_type: :multiple_choice)
      expect(question.multiple_choice?).to eq(true)
      question.save
      expect(Question.count).to eq(0)
      expect(question.errors.size).to eq(4)
      expect(question.errors.details[:answers][0][:error]).to be(:wrong_length)
      expect(question.errors.details[:ability][0][:error]).to be(:blank)
      expect(question.errors.details[:competence][0][:error]).to be(:blank)
    end
  end
end
