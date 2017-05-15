require 'rails_helper'

RSpec.describe AbilitiesController, type: :controller do
  let(:great_theme) { Fabricate :great_theme }
  let(:knowledge_object) { great_theme.knowledge_objects.first }

  describe 'GET #index' do
    before { get :index, params: { knowledge_object_id: knowledge_object.id } }
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:abilities)).to match_array(knowledge_object.abilities) }
  end

  describe 'GET #new' do
    before { get :new, params: { knowledge_object_id: knowledge_object.id } }
    it { expect(response).to render_template :new }
    it { expect(assigns(:ability)).to be_a_new Ability }
  end

  describe 'GET #edit' do
    let(:ability) { Fabricate :ability }
    before { get :edit, params: { id: ability.id, knowledge_object_id: knowledge_object.id } }
    it { expect(response).to render_template :edit }
  end

  context 'with invalid values' do
    describe 'does not create an ability' do
      let(:ability) { { description: '' } }
      before { post :create, params: { ability: ability, knowledge_object_id: knowledge_object.id } }
      it { expect(response.status).to eq(400) }
      it { expect(response).to render_template :new }
    end

    describe 'does not update an ability' do
      let(:ability) { Fabricate :ability }
      let(:new_ability) { { description: '' } }
      before { put :update, params: { id: ability.id, ability: new_ability, knowledge_object_id: knowledge_object.id } }
      it { expect(response.status).to eq(400) }
      it { expect(response).to render_template :edit }
    end
  end

  context 'with valid values' do
    describe 'create an ability' do
      let(:ability) { { description: 'foo' } }
      before { post :create, params: { ability: ability, knowledge_object_id: knowledge_object.id } }
      it { expect(response).to redirect_to knowledge_object_abilities_path }
    end

    describe 'update an ability' do
      let(:ability) { Fabricate :ability }
      let(:new_ability) { { description: 'foo' } }
      before { put :update, params: { id: ability.id, ability: new_ability, knowledge_object_id: knowledge_object.id } }
      it { expect(response).to redirect_to knowledge_object_abilities_path }
    end
  end
end
