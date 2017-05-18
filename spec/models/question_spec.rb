require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'valid questions' do
    it 'create a multiple choice question' do
      question = Fabricate.build (:multiple_choice)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(5)
      expect(Question.count).to eq(1)
    end

    it 'create a discursive question' do
      question = Fabricate.build (:discursive)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(1)
      expect(Question.count).to eq(1)
    end

    it 'create a true or false question' do
      question = Fabricate.build (:true_false)
      question.answers.first.correct!
      question.save
      expect(question.answers.where(correct: true).count).to eq 1
      expect(question.answers.count).to eq(2)
      expect(Question.count).to eq(1)
    end
  end

  context 'with invalid data' do
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

  context 'with invalid number of answers' do
    context 'with no answers' do
      describe 'does not create' do
        it 'multiple choice question' do
          question = Fabricate.build(:multiple_choice, answers: [])
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'discursive question' do
          question = Fabricate.build(:discursive, answers: [])
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'true false question' do
          question = Fabricate.build(:true_false, answers: [])
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end
      end
    end

    context 'with too many answers' do
      describe 'does not create' do
        it 'multiple choice question' do
          question = Fabricate.build(:multiple_choice)
          aditional_answer = Fabricate.build(:answer)
          question.answers << aditional_answer
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'discursive question' do
          question = Fabricate.build(:discursive)
          aditional_answer = Fabricate.build(:answer)
          question.answers << aditional_answer
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'true false question' do
          question = Fabricate.build(:true_false)
          aditional_answer = Fabricate.build(:answer)
          question.answers << aditional_answer
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end
      end
    end
  end

  context 'with invalid number of correct answers' do
    context 'with to many correct answers' do
      describe 'does not create' do
        it 'multiple choice question' do
          question = Fabricate.build(:multiple_choice)
          question.answers.each { |a| a.correct! }
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'true false question' do
          question = Fabricate.build(:true_false)
          question.answers.each { |a| a.correct! }
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end
      end
    end

    context 'with no correct answer' do
      describe 'does not create' do
        it 'multiple choice question' do
          question = Fabricate.build(:multiple_choice)
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'discursive question' do
          question = Fabricate.build(:discursive)
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end

        it 'true false question' do
          question = Fabricate.build(:true_false)
          expect(question).to_not be_valid
          expect(question.errors[:answers]).to_not be_empty
        end
      end
    end
  end
end
