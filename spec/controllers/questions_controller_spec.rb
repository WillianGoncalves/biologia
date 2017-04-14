require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    before {get :index}
    it {expect(response.status).to eq(200)}
  end

  describe 'GET #new' do
    before {get :new}
    it {expect(response.status).to eq(200)}
  end

  context 'valid values' do
    describe 'create question' do
      let(:ability) {Fabricate :ability}
      let(:competence) {Fabricate :competence}
      let(:question) {{statement: Faker::Lorem.sentence, question_type: "discursive", ability_id: ability.id, competence_id: competence.id, answers_attributes: [{text: Faker::Lorem.sentence, correct: true}]}}
      before {post :create, params: {question: question}}
      it {expect(response.status).to eq(200)}
      it {expect(Question.count).to eq(1)}
      it {expect(Answer.count).to eq(1)}
    end
  end

end
