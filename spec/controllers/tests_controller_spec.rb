require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  describe 'generate tests' do
    let!(:ability) { Fabricate :ability }
    let!(:other_ability) { Fabricate :ability }
    let!(:question_1) { Fabricate :discursive, ability: ability }
    let!(:question_2) { Fabricate :discursive, ability: ability }
    let!(:question_3) { Fabricate :discursive, ability: ability }
    let!(:question_4) { Fabricate :discursive, ability: other_ability }
    let!(:discipline) { ability.knowledge_object.great_theme.discipline }

    describe 'GET #index' do
      before { get :index }
      it { expect(assigns(:questions)).to be_empty }
    end

    context 'with invalid params' do
      describe 'with invalid questions_number' do
        let(:questions_number) { Question.count + 1 }
        before { get :index, params: { discipline_id: discipline, questions_number: questions_number }}
        it { expect(assigns(:questions)).to match_array [question_1, question_2, question_3] }
      end

      describe 'withou discipline_id but with questions_number' do
        before { get :index, params: { questions_number: 1 } }
        it { expect(assigns(:questions)).to be_empty }
      end
    end

    context 'with valid params' do
      describe 'with discipline_id' do
        before { get :index, params: { discipline_id: discipline } }
        it { expect(assigns(:questions)).to match_array [question_1, question_2, question_3] }
      end

      describe 'with questions_number' do
        it { expect(Question.count).to eq 4 }
        before { get :index, params: { discipline_id: discipline, questions_number: '1' } }
        it { expect(assigns(:questions).size).to eq 1 }
      end
    end
  end
end
