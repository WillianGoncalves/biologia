require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to render_template :index }
    it { expect(assigns(:questions)).to eq Question.all }
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(response).to render_template :new }
    it { expect(assigns(:question)).to be_a_new Question }
  end

  describe 'GET #show' do
    let(:question) { Fabricate :discursive }
    before { get :show, params: { id: question } }
    it { expect(response).to render_template :show }
    it { expect(assigns(:question)).to eq question }
  end

  describe 'GET #edit' do
    let(:question) { Fabricate :discursive }
    before { get :edit, params: { id: question } }
    it { expect(response).to render_template :edit }
    it { expect(assigns(:question)).to eq question }
  end

  describe 'DELETE' do
    let(:question) { Fabricate :discursive }
    before { delete :destroy, params: { id: question } }
    it { expect(response).to redirect_to questions_path }
    it { expect(Question.all.include?(question)).to eq false }
  end

  context 'with invalid values' do
    describe 'POST #create' do
      let(:ability) { Fabricate :ability }
      let(:competence) { Fabricate :competence }
      let(:question) { { statement: '', question_type: "discursive", ability_id: nil, competence_id: nil, answers_attributes: [] } }
      before { post :create, params: { question: question } }
      it { expect(response.status).to eq 400 }
      it { expect(response).to render_template :new }
    end

    describe 'PUT #update' do
      let(:question) { Fabricate :discursive }
      let(:invalid_question) { { statement: '', question_type: "discursive" } }
      before { put :update, params: { id: question, question: invalid_question } }
      it { expect(response.status).to eq 400 }
      it { expect(response).to render_template :edit }
    end
  end

  context 'with valid values' do
    describe 'POST #create' do
      let(:ability) { Fabricate :ability }
      let(:competence) { Fabricate :competence }
      let(:question) { { statement: Faker::Lorem.sentence, question_type: "discursive", ability_id: ability, competence_id: competence, answers_attributes: [{ text: Faker::Lorem.sentence, correct: true }] } }
      before { post :create, params: { question: question } }
      it { expect(Question.count).to eq(1) }
      it { expect(Answer.count).to eq(Question::MAX_DISCURSIVE_ANSWERS) }
      it { expect(response).to redirect_to questions_path }
      it { expect(assigns(:question).ability).to eq ability }
      it { expect(assigns(:question).competence).to eq competence }
    end

    describe 'PUT #update' do
      let(:question) { Fabricate :discursive }
      let(:valid_question) { { statement: Faker::Lorem.sentence, question_type: "discursive" } }
      before { put :update, params: { id: question, question: valid_question } }
      it { expect(response).to redirect_to questions_path }
    end
  end

end
