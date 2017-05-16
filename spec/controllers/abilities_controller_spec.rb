require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do

  context 'json' do
    describe 'GET #index' do
      let(:ko) { Fabricate :knowledge_object }
      before { get :index, params: { knowledge_object_id: ko, format: :json } }
      it { expect(response.status).to eq(200) }
      it { expect(response.content_type).to eq('application/json') }
      it { expect(response.body).to eq ko.abilities.to_json }
    end
  end

  context 'rails' do
    let(:ko) { Fabricate :knowledge_object }

    context 'GET #index' do
      describe 'with knowledge_object_id' do
        before { get :index, params: { knowledge_object_id: ko } }
        it { expect(response).to render_template :index }
        it { expect(assigns(:abilities)).to eq ko.abilities }
      end

      describe 'without knowledge_object_id' do
        before { get :index }
        it { expect(response).to render_template :index }
        it { expect(assigns(:abilities)).to eq Ability.all }
      end
    end

    describe 'GET #new' do
      before { get :new }
      it { expect(response).to render_template :new }
      it { expect(assigns(:ability)).to be_a_new Ability }
    end

    describe 'GET #show' do
      let(:ability) { Fabricate :ability }
      before { get :show, params: { id: ability } }
      it { expect(response).to render_template :show }
      it { expect(assigns(:ability)).to eq ability }
    end

    describe 'GET #edit' do
      let(:ability) { Fabricate :ability }
      before { get :edit, params: { id: ability } }
      it { expect(response).to render_template :edit }
      it { expect(assigns(:ability)).to eq ability}
    end

    describe 'DELETE' do
      let(:ability) { Fabricate :ability }
      before { delete :destroy, params: { id: ability } }
      it { expect(response).to redirect_to abilities_path }
      it { expect(Ability.all.include?(ability)).to eq false }
    end

    context 'with invalid values' do
      describe 'POST #create' do
        let(:ability) { { description: '', knowledge_object_id: ko } }
        before { post :create, params: { ability: ability } }
        it { expect(response.status).to eq(400) }
        it { expect(response).to render_template :new }
      end

      describe 'does not update an ability' do
        let(:ability) { Fabricate :ability }
        let(:invalid_ability) { { description: '', knowledge_object_id: ko } }
        before { put :update, params: { id: ability.id, ability: invalid_ability } }
        it { expect(response.status).to eq(400) }
        it { expect(response).to render_template :edit }
      end
    end

    context 'with valid values' do
      describe 'POST #create' do
        let(:ability) { { description: 'foo', knowledge_object_id: ko } }
        before { post :create, params: { ability: ability } }
        it { expect(response).to redirect_to abilities_path }
        it { expect(assigns(:ability).knowledge_object).to eq ko }
      end

      describe 'does not update an ability' do
        let(:ability) { Fabricate :ability }
        let(:valid_ability) { { description: 'foo', knowledge_object_id: ko } }
        before { put :update, params: { id: ability.id, ability: valid_ability } }
        it { expect(response).to redirect_to abilities_path }
      end
    end

  end
end
