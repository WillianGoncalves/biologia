require 'rails_helper'

RSpec.describe CompetencesController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to render_template :index }
    it { expect(assigns(:competences)).to eq Competence.all }
  end

  describe 'GET #show' do
    let(:competence) { Fabricate :competence }
    before { get :show, params: { id: competence } }
    it { expect(response).to render_template :show }
    it { expect(assigns(:competence)).to eq competence }
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(response).to render_template :new }
    it { expect(assigns(:competence)).to be_a_new Competence}
  end

  describe 'GET #edit' do
    let(:competence) { Fabricate :competence }
    before { get :edit, params: { id: competence } }
    it { expect(response).to render_template :edit }
    it { expect(assigns(:competence)).to eq competence }
  end

  describe 'DELETE' do
    let(:competence) { Fabricate :competence }
    before { delete :destroy, params: { id: competence } }
    it { expect(response).to redirect_to competences_path }
    it { expect(Competence.all.include?(competence)).to eq false }
  end

  context 'with invalid values' do
    describe 'POST #create' do
      let(:competence) { { description: '' } }
      before { post :create, params: { competence: competence } }
      it { expect(response.status).to eq 400 }
      it { expect(response).to render_template :new }
    end

    describe 'PUT #update' do
      let(:competence) { Fabricate :competence }
      let(:invalid_competence) { { description: '' } }
      before { put :update, params: { id: competence, competence: invalid_competence } }
      it { expect(response.status).to eq 400 }
      it { expect(response).to render_template :edit }
    end
  end

  context 'with valid values' do
    describe 'POST #create' do
      let(:competence) { { description: 'foo' } }
      before { post :create, params: { competence: competence } }
      it { expect(response).to redirect_to competences_path }
    end

    describe 'PUT #update' do
      let(:competence) { Fabricate :competence }
      let(:valid_competence) { { description: 'foo' } }
      before { put :update, params: { id: competence, competence: valid_competence } }
      it { expect(response).to redirect_to competences_path }
      it { expect(assigns(:competence).description).to eq 'foo' }
    end
  end
end
